import React, {Component} from 'react'
import TextBlock from '../components/TextBlock'
import SearchContainer from '../containers/SearchContainer'
import FormInput from '../components/FormInput'

class HomePageContainer extends Component {
  constructor(props) {
    super(props);

    this.state = {
      terms: ""
    }

    this.handleChange = this.handleChange.bind(this)
  }

  handleChange(event) {
    this.setState({ terms: event.target.value })
    console.log(this.state.terms)
  }

  handleFormSubmit(event){
    event.preventDefault()
  }

  render() {
    return(
      <div>
        <TextBlock
          title = {"My Ukulele dot Info"}
          body = {`A website that allows ukulele enthusiasts afflicted with "UAS" -
          "Ukulele Acquisition Syndrome" - to share their collections with the world online, share through social media, and seek inspiration for their next purchase.`}
        />
        <SearchContainer
          name = {"Search"}
          handleChange = {this.handleChange}
          handleFormSubmit = {this.handleFormSubmit}
        />
      </div>
    )
  }
}

export default HomePageContainer;
