import React from 'react';

const TextField = props => {
  return (
    <label>{props.label}
      <input
        name={props.name}
        onChange={props.onChange}
        type='text'
        id={props.id}
      />
    </label>
  );
}

export default TextField;
