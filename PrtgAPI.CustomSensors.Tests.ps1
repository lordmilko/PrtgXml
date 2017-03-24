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

			$xml | Should Be "<Prtg>`r`n    <Result>`r`n        <Channel>My channel</Channel>`r`n        <Value>3</Value>`r`n    </Result>`r`n</Prtg>"
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

            $expectedXml =
                "<Prtg>`r`n" +
                "    <Result>`r`n        <Channel>First channel</Channel>`r`n        <Value>3.5</Value>`r`n    </Result>`r`n" +
                "    <Result>`r`n        <Channel>Second channel</Channel>`r`n        <Value>4000</Value>`r`n    </Result>`r`n" +
                "</Prtg>"

			$xml | Should Be $expectedXml
		}

		It "Should have a channel and a message" {
			$xml = Prtg {
				Text "Hello!"
				Result {
					Channel "My channel"
					Value 4
				}
			}

			$xml | Should Be "<Prtg>`r`n    <Text>Hello!</Text>`r`n    <Result>`r`n        <Channel>My channel</Channel>`r`n        <Value>4</Value>`r`n    </Result>`r`n</Prtg>"
		}

		It "Should have multiple channel modifiers" {
			$xml = Prtg {
				Result {
					Channel "My channel"
					Value 50
                    ValueLookup prtg.standardlookups.yesno.stateyesok
				}
			}

            $xml | Should Be "<Prtg>`r`n    <Result>`r`n        <Channel>My channel</Channel>`r`n        <Value>50</Value>`r`n        <ValueLookup>prtg.standardlookups.yesno.stateyesok</ValueLookup>`r`n    </Result>`r`n</Prtg>"
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
			"<Prtg>`r`n" +
				"    <Error>1</Error>`r`n" +
				"    <Text>Woops!</Text>`r`n" +
				"    <Result>`r`n" +
					"        <Channel>My channel</Channel>`r`n" +
					"        <Value>3</Value>`r`n" +
					"        <Unit>Custom</Unit>`r`n" +
					"        <CustomUnit>Bloops</CustomUnit>`r`n" +
					"        <SpeedSize>KiloByte</SpeedSize>`r`n" +
					"        <VolumeSize>TeraBit</VolumeSize>`r`n" +
					"        <SpeedTime>Day</SpeedTime>`r`n" +
					"        <Mode>Difference</Mode>`r`n" +
					"        <Float>1</Float>`r`n" +
					"        <DecimalMode>Auto</DecimalMode>`r`n" +
					"        <Warning>1</Warning>`r`n" +
					"        <ShowChart>1</ShowChart>`r`n" +
					"        <ShowTable>1</ShowTable>`r`n" +
					"        <LimitMaxError>30</LimitMaxError>`r`n" +
					"        <LimitMaxWarning>20</LimitMaxWarning>`r`n" +
					"        <LimitMinWarning>10</LimitMinWarning>`r`n" +
					"        <LimitMinError>5</LimitMinError>`r`n" +
					"        <LimitErrorMsg>Things are not looking good</LimitErrorMsg>`r`n" +
					"        <LimitWarningMsg>Things could be better</LimitWarningMsg>`r`n" +
					"        <LimitMode>1</LimitMode>`r`n" +
					"        <ValueLookup>prtg.standardlookups.yesno.stateyesok</ValueLookup>`r`n" +
					"        <NotifyChanged />`r`n" +
				"    </Result>`r`n" +
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

        It "Should throw with invalid argument type" {
            { Prtg "a" } | Should Throw "Cannot convert the `"a`" value of type `"System.String`" to type `"System.Management.Automation.ScriptBlock`""
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

        It "Should throw with invalid argument type" {
            { Prtg {
                Result "a"
            } } | Should Throw "Cannot convert the `"a`" value of type `"System.String`" to type `"System.Management.Automation.ScriptBlock`""
        }
	}
}

Describe "Error Tags" {
	It "Should contain an error" {
		$xml = Prtg {
			Error 1
			Text "Woops!"
		}

		$xml | Should Be "<Prtg>`r`n    <Error>1</Error>`r`n    <Text>Woops!</Text>`r`n</Prtg>"
	}
}