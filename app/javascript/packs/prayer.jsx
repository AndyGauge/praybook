import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import WebpackerReact from 'webpacker-react'

class PrayerDialog extends React.Component {
  constructor(props) {
    super(props);

    this.state = { value: props.title || "",
                    last: '',
                 friends: [],
           filter_friend: [],
               menu_open: 'dropdown',
         include_friends: [] }

    this.handleChange=this.handleChange.bind(this);
    this.friendClicked=this.friendClicked.bind(this);

  }

  componentDidMount() {
    fetch("/friends/names.json", {
      method: "GET",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Cache': 'no-cache'
      },
      credentials: 'include'
    })
      .then(function(response) {
        return response.json()
      })
      .then(function(json_response) {
        this.setState({friends: json_response})
      }.bind(this)
    )

    this.listener.addEventListener("edit-prayer", this.fetchPrayer);
  }

  componentWillUnmount() {
    this.listener.removeEventListener("edit-prayer", this.fetchPrayer);
  }

  handleChange(event) {
    event.persist();
    console.log(event.key)
    switch (event.key) {
      case "Enter":
      this.friendClicked(this.state.filter_friend[0])
      break;

      case "Backspace":
      this.setState({value: event.target.value.slice(0,-1)})
      break;

      default:
      this.setState(function (state, props) {
        let value = event.target.value.concat(event.key)
        let last = value.split(" ").pop()
        let filter = state.friends.filter( elem => {
          if (elem['name'].toLowerCase().indexOf(last.toLowerCase()) != -1) {
            return true
          } else {
            return false
          }
        });
        return { value: value,
                 last: last,
                 menu_open: (last.length > 2 && filter.length > 0) ? 'dropdown open' : 'dropdown',
                 filter_friend: filter
               }
      })
    }
  }

  friendClicked(friend) {
    this.setState({value: this.state.value.replace(/\w+[.!?]?$/, '').concat(" ",friend.name, " "),
                   menu_open: "dropdown",
                   include_friends: [...this.state.include_friends ,friend]})
  }

  fetchPrayer = (event) => {
    console.log(event);
  }

  render() {
    let friends = this.state.filter_friend.map(friend => {
      let handleFriendClick = () => this.friendClicked(friend)
      return (
        <li key={friend.id}>
          <a onClick={handleFriendClick}>{friend.name}</a>
        </li>
      )
    })
    let inclusion = this.state.include_friends.map(friend => {
      return (
        <input type="hidden" value={friend.id} name="prayer[for][]" key = {friend.id} />
      )
    })

     return(
       <div className="prayer" ref={elem => this.listener = elem} id="edit_prayer">
         <label>
           <textarea placeholder="Our Father ..." className="form-control" name="prayer[title]" id="prayer_title" onKeyDown={this.handleChange} value={this.state.value}></textarea>
           <div className={this.state.menu_open}>
             <ul className="dropdown-menu">
               {friends}
             </ul>
           </div>
           {inclusion}
       </label>
       </div>
     );
   }
}

WebpackerReact.setup({PrayerDialog})
