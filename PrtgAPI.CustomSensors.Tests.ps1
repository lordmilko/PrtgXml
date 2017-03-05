Import-Module $PSScriptRoot\PrtgAPI.CustomSensors

Describe "Result Tags" {
	Context "Valid XML" {
		It "Should have one channel" {
			$xml = Prtg {
				Result {
					Channel "My channel"
					Value 3
				}
			}

			$xml | Should Be "<Prtg>`n`t<Result>`n`t`t<Channel>My channel</Channel>`n `t`t<Value>3</Value>`n`t</Result>`n</Prtg>"
		}

		It "Should have multiple channels" {
			$xml = Prtg {
				Result {
					Channel "First channel"
					Value 3.5
				}

				Result {
					Channel "Second channel"
					Value "4000"
				}
			}

			$xml | Should Be "<Prtg>`n`t<Result>`n`t`t<Channel>First channel</Channel>`n `t`t<Value>3.5</Value>`n`t</Result>`n `t<Result>`n`t`t<Channel>Second channel</Channel>`n `t`t<Value>4000</Value>`n`t</Result>`n</Prtg>"
		}

		It "Should have a channel and a message" {
			$xml = Prtg {
				Text "Hello!"
				Result {
					Channel "My channel"
					Value 4
				}
			}

			$xml | Should Be "<Prtg>`n`t<Text>Hello!</Text>`n `t<Result>`n`t`t<Channel>My channel</Channel>`n `t`t<Value>4</Value>`n`t</Result>`n</Prtg>"
		}

		It "Should have multiple channel modifiers" {
			$xml = Prtg {
				Result {
					Channel "My channel"
					Value 50

				}
			}
		}

		It "Should process all tags" {
			$xml = Prtg {
				Error 1
				Text "Woops!"
				Result {
					Channel "My channel"
					Value 3
					Unit Custom
					CustomUnit Bloops
					SpeedSize KiloByte
					VolumeSize TeraBit
					SpeedTime Day
					Mode Difference
					Float 1
					DecimalMode Auto
					Warning 1
					ShowChart 1
					ShowTable 1
					LimitMaxError 30
					LimitMaxWarning 20
					LimitMinWarning 10
					LimitMinError 5
					LimitErrorMsg "Things are not looking good"
					LimitWarningMsg "Things could be better"
					LimitMode 1
					ValueLookup "prtg.standardlookups.yesno.stateyesok"
					NotifyChanged
				}
			}

			$expectedXml =
			"<Prtg>`n" +
				"`t<Error>1</Error>`n" +
				" `t<Text>Woops!</Text>`n" +
				" `t<Result>`n" +
					"`t`t<Channel>My channel</Channel>`n" +
					" `t`t<Value>3</Value>`n" +
					" `t`t<Unit>Custom</Unit>`n" +
					" `t`t<CustomUnit>Bloops</CustomUnit>`n" +
					" `t`t<SpeedSize>KiloByte</SpeedSize>`n" +
					" `t`t<VolumeSize>TeraBit</VolumeSize>`n" +
					" `t`t<SpeedTime>Day</SpeedTime>`n" +
					" `t`t<Mode>Difference</Mode>`n" +
					" `t`t<Float>1</Float>`n" +
					" `t`t<DecimalMode>Auto</DecimalMode>`n" +
					" `t`t<Warning>1</Warning>`n" +
					" `t`t<ShowChart>1</ShowChart>`n" +
					" `t`t<ShowTable>1</ShowTable>`n" +
					" `t`t<LimitMaxError>30</LimitMaxError>`n" +
					" `t`t<LimitMaxWarning>20</LimitMaxWarning>`n" +
					" `t`t<LimitMinWarning>10</LimitMinWarning>`n" +
					" `t`t<LimitMinError>5</LimitMinError>`n" +
					" `t`t<LimitErrorMsg>Things are not looking good</LimitErrorMsg>`n" +
					" `t`t<LimitWarningMsg>Things could be better</LimitWarningMsg>`n" +
					" `t`t<LimitMode>1</LimitMode>`n" +
					" `t`t<ValueLookup>prtg.standardlookups.yesno.stateyesok</ValueLookup>`n" +
					" `t`t<NotifyChanged/>`n" +
				"`t</Result>`n" +
			"</Prtg>"

			$xml | Should Be $expectedXml
		}
	}

	Context "Invalid Prtg block" {

		$errorMessage = "Prtg block requires an inner element"

		It "Should throw without argument" {
			{ Prtg } | Should Throw $errorMessage
		}

		It "Should throw with empty script block" {
			{ Prtg {} } | Should Throw $errorMessage
		}

		It "Should throw with empty script block ignoring space" {
			{ Prtg { } } | Should Throw $errorMessage
		}

		It "Should throw with empty script block ignoring tab/newline" {
			{ Prtg {

			} } | Should Throw $errorMessage
		}

	}

	Context "Invalid Result block" {
		$errorMessage = "Result block requires an inner element"

		It "Should throw without argument" {
			{ Prtg { Result	} } | Should Throw $errorMessage
		}

		It "Should throw with empty script block" {
			{ Prtg { Result {} } } | Should Throw $errorMessage
		}

		It "Should throw with empty script block ignoring space" {
			{ Prtg { Result { }} } | Should Throw $errorMessage
		}

		It "Should throw with empty script block ignoring tab/newline" {
			{ Prtg {
				Result {

				}
			} } | Should Throw $errorMessage
		}
	}
}

Describe "Error Tags" {
	It "Should contain an error" {
		$xml = Prtg {
			Error 1
			Text "Woops!"
		}

		$xml | Should Be "<Prtg>`n`t<Error>1</Error>`n `t<Text>Woops!</Text>`n</Prtg>"
	}
}