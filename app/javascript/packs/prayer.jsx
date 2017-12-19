import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class PrayerDialog extends React.Component {
  constructor(props) {
    super(props);

    this.state ={value: '', last: '', friends: [] }
    this.handleChange=this.handleChange.bind(this);

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
  }

  handleChange(event) {
    this.setState({value: event.target.value,
                    last: event.target.value.split(" ").pop()})
    this.setState({friend: this.state.friends.filter( elem => {
        if (elem['name'].toLowerCase().indexOf(this.state.last.toLowerCase()) != -1) { return true }
        else { return false }
      })
    }, console.log(this.state.friend))

  }

  friends() {
    let to_return = '';
    for (var i=0;i<this.state.friends.length; i++) {
      to_return = to_return + " " + this.state.friends[i]['name']
    }
    return to_return;
  }

  render() {
     return(
       <div className="testing">
         <form>
         <label>
           <textarea placeholder="Our Father ..." className="form-control" name="prayer[title]" id="prayer_title" onChange={this.handleChange}></textarea>
           <textarea value={this.state.friend} readOnly></textarea>
       </label></form>
       </div>
     );
   }
}

ReactDOM.render(
  <PrayerDialog />,
  document.getElementById('prayer_dialog')
);
