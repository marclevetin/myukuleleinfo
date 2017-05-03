import React, {Component} from 'react'
import TextBlock from '../components/TextBlock'

class HomePageContainer extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div>
        <TextBlock
          title={"My Ukulele dot Info"}
          body={`A website that allows ukulele enthusiasts afflicted with "UAS" -
          "Ukulele Acquisition Syndrome" - to share their collections with the world online, share through social media, and seek inspiration for their next purchase.`}
        />
        Coming soon: Search bar<br />
        Coming soon: Search results with a couple recent ukes as a sample
      </div>
    )
  }
}

export default HomePageContainer;
