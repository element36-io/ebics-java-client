/*
 * Copyright (c) 1990-2012 kopiLeft Development SARL, Bizerte, Tunisia
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License version 2.1 as published by the Free Software Foundation.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 *
 * $Id$
 */

package org.kopi.ebics.session;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import org.kopi.ebics.exception.ReturnCode;
import org.kopi.ebics.interfaces.EbicsLogger;


/**
 * A simple EBICS transfers logger base on log4j framework.
 *
 * @author hacheni
 *
 */
public class DefaultEbicsLogger implements EbicsLogger {


  /**
   * Constructs a new ebics logger
   */
  public DefaultEbicsLogger() { 
  }



  @Override
  public void info(String message) {
    logger.info(message);
  }

  @Override
  public void warn(String message) {
    logger.warning(message);
  }

  @Override
  public void warn(String message, Throwable throwable) {
    logger.log(Level.WARNING,message, throwable);
  }

  @Override
  public void error(String message) {
    logger.log(Level.SEVERE,message);
  }

  @Override
  public void error(String message, Throwable throwable) {
    logger.log(Level.SEVERE,message,throwable);
  }

  @Override
  public void report(ReturnCode returnCode) {
    if (returnCode.isOk()) {
      info(returnCode.getText());
    } else {
      error(returnCode.getText());
    }
  }


  // --------------------------------------------------------------------
  // DATA MEMBERS
  // --------------------------------------------------------------------

  private final static Logger logger = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);



}
