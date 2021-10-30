import * as React from 'react';
import styles from './SpFxAgentTest.module.scss';
import { ISpFxAgentTestProps } from './ISpFxAgentTestProps';
import { escape } from '@microsoft/sp-lodash-subset';

export default class SpFxAgentTest extends React.Component<ISpFxAgentTestProps, {}> {
  public render(): React.ReactElement<ISpFxAgentTestProps> {
    return (
      <div className={ styles.spFxAgentTest }>
        <div className={ styles.container }>
          <div className={ styles.row }>
            <div className={ styles.column }>
              <span className={ styles.title }>Welcome to SharePoint!</span>
              <p className={ styles.subTitle }>Customize SharePoint experiences using Web Parts.</p>
              <p className={ styles.description }>{escape(this.props.description)}</p>
              <a href="https://aka.ms/spfx" className={ styles.button }>
                <span className={ styles.label }>Learn more</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
