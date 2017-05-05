import React, {Component} from 'react'
import Ukulele from '../components/Ukulele'

class Search extends Component {
  constructor(props) {
    super(props);

    this.state = {
      ukuleles: []
    }
  }

  componentDidMount() {
    fetch('/api/v1/ukuleles')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({ ukuleles: body.ukuleles });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let ukuleles = this.state.ukuleles.map(uke => {
      return(
        <Ukulele
          key={uke.id}
          id={uke.id}
          type={uke.instrument_type}
          size={uke.ukulele_size}
          shape={uke.ukulele_shape}
        />
      )
    })

    return(
      <div>
        Search bar goes here
        Results
        <table>
          <tbody>
          <tr>
            <th>Type</th><th>Size</th><th>Shape</th>
          </tr>
              {ukuleles}
          </tbody>
        </table>
      </div>
    )
  }
}

export default Search;
