import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class PrayerDialog extends React.Component {
   render() {
     return(
       <div className="testing"></div>
     )
   }
}

ReactDOM.render(
  <PrayerDialog />,
  document.getElementById('prayer_dialog')
);
