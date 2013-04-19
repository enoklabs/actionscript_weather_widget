package com.reymadrid.views
{
	import libs.WeatherBase;
	import com.reymadrid.ui.ImageViewer;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class WeatherView extends WeatherBase
	{
		private var _degreeTypes:Array;
		
		public function WeatherView()
		{
			super();
			init();
		}
		private function init() : void
		{
			setupButton();
			_degreeTypes = [tfDegreeType1, tfDegreeType2, tfDegreeType3, tfDegreeType4, tfDegreeType5];
		}
		
		private function setupButton() : void
		{
			resetBtn.gotoAndStop(1);
			resetBtn.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		}
		
		private function imageByCode(code:String) : String
		{
			var img:String = "";
			if (code == "0")
			{
				img = "tornado.png";
			}
			else
			{
				if (code != "1")
				{
				}
				if (code == "2")
				{
					img = "hurricaine.png";
				}
				else
				{
					if (code != "3")
					{
					}
					if (code != "4")
					{
					}
					if (code != "37")
					{
					}
					if (code != "38")
					{
					}
					if (code != "39")
					{
					}
					if (code != "45")
					{
					}
					if (code == "47")
					{
						img = "tstorm3.png";
					}
					else
					{
						if (code != "5")
						{
						}
						if (code != "6")
						{
						}
						if (code != "7")
						{
						}
						if (code == "18")
						{
							img = "sleet.png";
						}
						else
						{
							if (code != "8")
							{
							}
							if (code != "10")
							{
							}
							if (code == "35")
							{
								img = "hail_mixed.png";
							}
							else
							{
								if (code != "9")
								{
								}
								if (code == "40")
								{
									img = "light_rain.png";
								}
								else
								{
									if (code != "11")
									{
									}
									if (code == "12")
									{
										img = "shower3.png";
									}
									else
									{
										if (code != "13")
										{
										}
										if (code != "14")
										{
										}
										if (code != "42")
										{
										}
										if (code == "46")
										{
											img = "snow4.png";
										}
										else
										{
											if (code != "15")
											{
											}
											if (code != "16")
											{
											}
											if (code != "41")
											{
											}
											if (code == "43")
											{
												img = "snow5.png";
											}
											else if (code == "17")
											{
												img = "hail.png";
											}
											else if (code == "19")
											{
												img = "dusty.png";
											}
											else
											{
												if (code != "20")
												{
												}
												if (code == "22")
												{
													img = "fog.png";
												}
												else if (code == "21")
												{
													img = "haze.png";
												}
												else
												{
													if (code != "23")
													{
													}
													if (code == "24")
													{
														img = "windy.png";
													}
													else if (code == "25")
													{
														img = "cold.png";
													}
													else if (code == "26")
													{
														img = "cloudy5.png";
													}
													else if (code == "27")
													{
														img = "cloudy4_night.png";
													}
													else if (code == "28")
													{
														img = "cloudy4.png";
													}
													else if (code == "29")
													{
														img = "cloudy2_night.png";
													}
													else
													{
														if (code != "30")
														{
														}
														if (code == "44")
														{
															img = "cloudy2.png";
														}
														else if (code == "31")
														{
															img = "clear_night.png";
														}
														else if (code == "32")
														{
															img = "sunny.png";
														}
														else if (code == "33")
														{
															img = "cloudy1_night.png";
														}
														else if (code == "34")
														{
															img = "cloudy1.png";
														}
														else if (code == "36")
														{
															img = "hot.png";
														}
														else if (code == "3200")
														{
															img = "dunno.png";
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			return img;
		}
		
		private function mouseDown(event:MouseEvent) : void
		{
			resetBtn.gotoAndStop(2);
			resetBtn.addEventListener(MouseEvent.MOUSE_UP, this.mouseUp);
			return;
		}
		
		private function mouseUp(event:MouseEvent) : void
		{
			resetBtn.gotoAndStop(1);
			resetBtn.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
			return;
		}
		
		public function set degreeType(dt:String):void
		{
			var degree:* = null;
			for each (degree in this._degreeTypes)
			{
				
				degree.text = dt;
			}
			return;
		}
		
		public function set location(value:String):void
		{
			tfLocation.text = value;
			return;
		}
		
		public function set todayHigh(value:String):void
		{
			tfTodayHigh.text = value;
			return;
		}
		
		public function set todayLow(value:String):void
		{
			tfTodayLow.text = value;
			return;
		}
		
		public function set todayCode(value:String):void
		{
			var tc:String = value;
			var iv:* = new ImageViewer();
			iv.path = "assets/images/icons/";
			var img:* = imageByCode(tc);
			iv.imageList = [img];
			iv.x = -72;
			iv.y = -79;
			var _x:* = 0.5;
			iv.scaleY = 0.5;
			iv.scaleX = _x;
			iv.display();
			this.addChild(iv);
			return;
		}
		
		public function set todayForecast(value:String) : void
		{
			tfTodayForecast.text = value;
			return;
		}
		
		public function set tomorrowHigh(value:String) : void
		{
			tfTomorrowHigh.text = value;
			return;
		}
		
		public function set tomorrowLow(value:String) : void
		{
			tfTomorrowLow.text = value;
			return;
		}
		
		public function set tomorrowCode(value:String) : void
		{
			var tmc:* = value;
			var iv:* = new ImageViewer();
			iv.path = "assets/images/icons/";
			var img:* = this.imageByCode(tmc);
			iv.imageList = [img];
			iv.x = 124;
			iv.y = -79;
			var _x:* = 0.5;
			iv.scaleY = 0.5;
			iv.scaleX = _x;
			iv.display();
			this.addChild(iv);
			return;
		}
		
		public function set tomorrowForecast(value:String) : void
		{
			tfTomorrowForecast.text = value;
			return;
		}
		
		public function set currentTemp(value:String) : void
		{
			tfCurrentTemp.text = value;
			return;
		}
		
		public function set speedType(value:String) : void
		{
			tfSpeedType.text = value;
			return;
		}
		
		public function set currentWindMPH(value:String) : void
		{
			var wind:* = Math.round(Number(value));
			var windMph:* = String(wind);
			tfWindMPH.text = windMph;
			return;
		}
		
		public function set currentWindDirection(value:String) : void
		{
			var windDir:* = Number(value);
			if (windDir == 0)
			{
				tfWindDirection.text = "";
			}
			else
			{
				if (windDir > 348.75)
				{
				}
				if (windDir < 11.25)
				{
					tfWindDirection.text = "N";
				}
				else
				{
					if (windDir > 11.25)
					{
					}
					if (windDir < 33.75)
					{
						tfWindDirection.text = "NNE";
					}
					else
					{
						if (windDir > 33.75)
						{
						}
						if (windDir < 56.25)
						{
							tfWindDirection.text = "NE";
						}
						else
						{
							if (windDir > 56.25)
							{
							}
							if (windDir < 78.75)
							{
								tfWindDirection.text = "ENE";
							}
							else
							{
								if (windDir > 78.75)
								{
								}
								if (windDir < 101.25)
								{
									tfWindDirection.text = "E";
								}
								else
								{
									if (windDir > 101.25)
									{
									}
									if (windDir < 123.75)
									{
										tfWindDirection.text = "ESE";
									}
									else
									{
										if (windDir > 123.75)
										{
										}
										if (windDir < 146.25)
										{
											tfWindDirection.text = "SE";
										}
										else
										{
											if (windDir > 146.25)
											{
											}
											if (windDir < 168.75)
											{
												tfWindDirection.text = "SSE";
											}
											else
											{
												if (windDir > 168.75)
												{
												}
												if (windDir < 191.25)
												{
													tfWindDirection.text = "S";
												}
												else
												{
													if (windDir > 191.25)
													{
													}
													if (windDir < 213.75)
													{
														tfWindDirection.text = "SSW";
													}
													else
													{
														if (windDir > 213.75)
														{
														}
														if (windDir < 236.25)
														{
															tfWindDirection.text = "SW";
														}
														else
														{
															if (windDir > 236.25)
															{
															}
															if (windDir < 258.75)
															{
																tfWindDirection.text = "WSW";
															}
															else
															{
																if (windDir > 258.75)
																{
																}
																if (windDir < 281.25)
																{
																	tfWindDirection.text = "W";
																}
																else
																{
																	if (windDir > 281.25)
																	{
																	}
																	if (windDir < 303.75)
																	{
																		tfWindDirection.text = "WNW";
																	}
																	else
																	{
																		if (windDir > 303.75)
																		{
																		}
																		if (windDir < 326.25)
																		{
																			tfWindDirection.text = "NW";
																		}
																		else
																		{
																			if (windDir > 326.25)
																			{
																			}
																			if (windDir < 348.75)
																			{
																				tfWindDirection.text = "NNW";
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			return;
		}
	}
}