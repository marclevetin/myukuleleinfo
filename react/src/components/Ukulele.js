import React, {Component} from 'react'

const Ukulele = (props) => {
  return(
    <tr className='ukulelerow'>
      <td>{props.type}</td>
      <td>{props.size}</td>
      <td>{props.shape}</td>
      <td>{props.luthier}</td>
    </tr>
  )
}

export default Ukulele;
