import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Route, IndexRoute, Link, browserHistory } from 'react-router';
import Layout from './containers/Layout'
import HomePageContainer from './containers/HomePageContainer'
import UkuleleList from './containers/UkuleleList'


$(function() {
  ReactDOM.render(
    <div className="row">
      <Router history={browserHistory}>
        <Route path='/' component={Layout}>
          <IndexRoute component={HomePageContainer} />
          <Route path='/users/:id/ukuleles' component={UkuleleList} />
        </Route>
      </Router>
    </div>,
    document.getElementById('app')
  );
});
