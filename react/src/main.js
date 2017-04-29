import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

$(function() {
  ReactDOM.render(
    <div className="row">
      <h1>My Ukulele dot Info - Main.js</h1>
    </div>,
    document.getElementById('app')
  );
});
