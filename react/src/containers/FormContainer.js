import React, {Component} from 'react'
import TextField from '../components/TextField'
import {postUserUkulele} from '../components/network'

class FormContainer extends Component {
  constructor(props) {
    super(props);

    this.state = {
        instrument_type: "",
        ukulele_shape: "",
        ukulele_size: "",
        luthier: ""
    }
    this.handleInput = this.handleInput.bind(this)
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
  }

  handleInput(event) {
    this.setState({
      [event.target.id]: event.target.value
    })
  }

  handleFormSubmit(event) {
    event.preventDefault();
    postUserUkulele(this.state)
    .then(response => response.json())
    .then(json => {
      if (json.status === "Success") {
        this.props.addLocalUkulele(json.ukulele)
      }
    })

  }

  render() {
    return(
      <div>
      <h2>Add a ukulele</h2>
        <form className="callout" onSubmit={this.handleFormSubmit}>
          <TextField
            label="Type"
            name="instrument_type"
            id="instrument_type"
            onChange={this.handleInput}
          />
          <TextField
            label="Shape"
            name="ukulele_shape"
            id="ukulele_shape"
            onChange={this.handleInput}
          />
          <TextField
            label="Size"
            name="ukulele_size"
            id="ukulele_size"
            onChange={this.handleInput}
          />
          <TextField
            label="Luthier"
            name="luthier"
            id="luthier"
            onChange={this.handleInput}
          />
          <input type="submit" value="Submit" />
        </form>
      </div>
    )
  }
}

export default FormContainer;
