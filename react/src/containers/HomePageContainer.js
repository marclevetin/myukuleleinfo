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
          title = {"Welcome"}
          body = {`Got "UAS" - "Ukulele Acquisition Syndrome"?
          Share your collection with the world, share through social media, and seek inspiration for your next purchase.`}
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
