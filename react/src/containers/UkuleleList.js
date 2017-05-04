import React, {Component} from 'react'
import { Link } from 'react-router'
import Ukulele from '../components/Ukulele'
import FormContainer from './FormContainer'
import {getUserUkuleles} from '../components/network'

class UkuleleList extends Component {
  constructor(props) {
    super(props);

    this.state = {
      ukuleles: []
    }

  this.componentDidMount = this.componentDidMount.bind(this)
  this.addLocalUkulele = this.addLocalUkulele.bind(this)
  }

  componentDidMount(){
    getUserUkuleles()
    .then(response => response.json())
    .then(json => {
      this.setState({ukuleles: json.ukuleles})
    })
  }

  addLocalUkulele(ukulele) {
    this.setState({
      ukuleles: this.state.ukuleles.concat([ukulele])
    })
    debugger;
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
          luthier={uke.luthier}
        />
      )
    })

    return(
      <div className="row">
        <div className="small-10 medium-6 large-6 columns">
          <h1>Ukulele list</h1>
          <table>
            <tbody>
            <tr>
              <th>Type</th><th>Size</th><th>Shape</th><th>Luthier</th>
            </tr>
                {ukuleles}
            </tbody>
          </table>
          <FormContainer
          addLocalUkulele = {this.addLocalUkulele}
          />
        </div>
      </div>
    )
  }
}

export default UkuleleList;
