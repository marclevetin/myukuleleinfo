import React, {Component} from 'react'

const Ukulele = (props) => {
  return(
    <tr className='ukulelerow'>
        <td><a href={"users/" + props.user_id + "/ukuleles/" + props.id}><img src={props.photo} /></a></td>
        <td><a href={"users/" + props.user_id + "/ukuleles/" + props.id}>{props.type}</a></td>
        <td><a href={"users/" + props.user_id + "/ukuleles/" + props.id}>{props.size}</a></td>
        <td><a href={"users/" + props.user_id + "/ukuleles/" + props.id}>{props.shape}</a></td>
    </tr>
  )
}

export default Ukulele;
