import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import UkuleleList from './containers/UkuleleList'

$(function() {
  ReactDOM.render(
    <div className="row">
      <h1>My Ukulele dot Info</h1>
      <p>A website that allows ukulele enthusiasts afflicted with "UAS" -
      "Ukulele Acquisition Syndrome" - to share their collections with the world online, share through social media, and seek inspiration for their next purchase.
      </p>
      <UkuleleList />
    </div>,
    document.getElementById('app')
  );
});
