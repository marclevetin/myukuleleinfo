import React, {Component} from 'react'
import Ukulele from '../components/Ukulele'
import FormInput from '../components/FormInput'

class SearchContainer extends Component {
  constructor(props) {
    super(props);

    this.state = {
      ukuleles: {ukuleles: []},
      terms: "",
      content: "",
      returnedData: []
    }

    this.handleChange = this.handleChange.bind(this)
    this.getSearchResults = this.getSearchResults.bind(this)
  }

  getSearchResults() {
    let query = { query: this.state.content }
    fetch(`/api/v1/ukuleles`, {
      method: 'POST',
      credentials: 'include',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(query)
    })
    .then(response => response.json())
    .then(responseData => {
      this.setState({ ukuleles: responseData })
    });
  }

  handleChange(event) {
    this.setState({ content: event.target.value }, this.getSearchResults());
  }

  render() {
    let searchResults = this.state.ukuleles["ukuleles"]
    let ukuleles = searchResults.map(uke => {
    let photo;
      if (uke.photos[0] === undefined) {
        photo = "";
      } else {
        photo = uke.photos[0]["thumb"]["url"];
        console.log(photo);
      }
      return(
        <Ukulele
          key={uke.id}
          id={uke.id}
          user_id={uke.user_id}
          type={uke.instrument_type}
          size={uke.ukulele_size}
          shape={uke.ukulele_shape}
          photo = {photo}
        />
      )
    })

    return(
      <div className='search'>
        <FormInput
          content = {this.state.content}
          handleChange = {this.handleChange}
         />
        <table>
          <tbody>
          <tr>
            <th>Pic</th><th>Type</th><th>Size</th><th>Shape</th>
          </tr>
              {ukuleles}
          </tbody>
        </table>
      </div>
    )
  }
}

export default SearchContainer;
