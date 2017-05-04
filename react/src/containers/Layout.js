import React, {Component} from 'react'
import { Link } from 'react-router'
import UkuleleList from './UkuleleList'


const Layout = (props) => {
  return(
  <div>
    {props.children}
  </div>
  )
}

export default Layout;
