stk.v.8.0

BEGIN Facility

Name        USAFA

	BEGIN CentroidPosition

		CentralBody            Earth
		DisplayCoords          Geodetic
		EcfLatitude            3.90060000000000e+001
		EcfLongitude           -1.04883000000000e+002
		EcfAltitude            2.18400000000000e+003
		HeightAboveGround      0.00000000000000e+000
		DisplayAltRef          Ellipsoid
		UseTerrainInfo         Off
		NumAzRaysInMask        360
		TerrainNormalMode      UseCbShape

	END CentroidPosition

BEGIN Extensions
    
    BEGIN Graphics

            BEGIN Attributes

                MarkerColor             #d2691e
                LabelColor              #d2691e
                LineStyle               0
                MarkerStyle             9
                FontStyle               0

            END Attributes

            BEGIN Graphics

                Inherit                 On
                ShowLabel               On
                ShowAzElMask            Off
                ShowAzElFill            Off
                AzElFillStyle           7
                AzElColor               Default
                MinDisplayAlt           2184.000
                MaxDisplayAlt           10000000.000
                NumAzElMaskSteps        1
                ShowAzElAtRangeMask       Off
                ShowAzElAtRangeFill       Off
                AzElAtRangeFillStyle      7
                AzElAtRangeColor          Default
                MinDisplayRange           0.000
                MaxDisplayRange           10000000.000
                NumAzElAtRangeMaskSteps   1

            BEGIN RangeContourData
                    Show                 Off
                    ShowRangeFill        Off
                    RangeFillStyle       7
                    LabelUnits           4
                    NumDecimalDigits     3
            BEGIN ContourLevel
                Value      1.000000000000e+005
                Color      #4169e1
                LineStyle  0
                LineWidth  1
                Numbered   On
                ShowText   Off
                LabelAngle 180
            END ContourLevel
            BEGIN ContourLevel
                Value      2.000000000000e+005
                Color      #87cefa
                LineStyle  0
                LineWidth  1
                Numbered   On
                ShowText   Off
                LabelAngle 180
            END ContourLevel
            BEGIN ContourLevel
                Value      3.000000000000e+005
                Color      #00ced1
                LineStyle  0
                LineWidth  1
                Numbered   On
                ShowText   Off
                LabelAngle 180
            END ContourLevel
            BEGIN ContourLevel
                Value      4.000000000000e+005
                Color      #6b8e23
                LineStyle  0
                LineWidth  1
                Numbered   On
                ShowText   Off
                LabelAngle 180
            END ContourLevel
            BEGIN ContourLevel
                Value      5.000000000000e+005
                Color      #8fbc8f
                LineStyle  0
                LineWidth  1
                Numbered   On
                ShowText   Off
                LabelAngle 180
            END ContourLevel

            END RangeContourData

            END Graphics
    END Graphics
    
    BEGIN LaserCAT
		Mode                     TargetObject
		StartTime                1 Jul 2006 12:00:00.000000000
		StopTime                 2 Jul 2006 12:00:00.000000000
		RangeConstraint         500000000.00000
		MinElevationAng         0.34907
		Duration                0.00000
		ExclHalfAng             0.08727
		MaxPVtoScenario         10
		CenterFrequency         14000000000.00000
		BandWidth               20000000.00000
		PowerFlux/EIRP          140.00000
		PowerThreshold          -32.00000
		TransmitOn              1
		ReceiveOn               0
		PVDataBase              STKData\Databases\Satellite\stkSatDb.tce
		RFIDataBase             STKData\Databases\Satellite\stkAllComm.rfi
		LaserDispersionAngle    0.00000
		KOCTimeStep             1.00000
		UseOutOfDate            Yes
		NearEarthOutOfDate       10.00000
		DeepSpaceOutOfDate       40.00000
		ModelIntrackUncert      Yes
		UseTrajectoryFilter     No
		UsePotVictimList        No
    END LaserCAT
    
    BEGIN ExternData
    END ExternData
    
    BEGIN RFI
		Mode                     TargetObject
		StartTime                1 Jul 2006 12:00:00.000000000
		StopTime                 2 Jul 2006 12:00:00.000000000
		RangeConstraint         500000000.00000
		MinElevationAng         0.34907
		Duration                0.00000
		ExclHalfAng             0.08727
		MaxPVtoScenario         10
		CenterFrequency         14000000000.00000
		BandWidth               20000000.00000
		PowerFlux/EIRP          140.00000
		PowerThreshold          -32.00000
		TransmitOn              1
		ReceiveOn               0
		PVDataBase              STKData\Databases\Satellite\stkAllComm.tce
		RFIDataBase             STKData\Databases\Satellite\stkAllComm.rfi
		LaserDispersionAngle    0.00000
		KOCTimeStep             1.00000
		UseOutOfDate            Yes
		NearEarthOutOfDate       10.00000
		DeepSpaceOutOfDate       40.00000
		ModelIntrackUncert      Yes
		UseTrajectoryFilter     No
		UsePotVictimList        No
    END RFI
    
    BEGIN AccessConstraints
		LineOfSight   IncludeIntervals 
    END AccessConstraints
    
    BEGIN ObjectCoverage
    END ObjectCoverage
    
    BEGIN Desc
        ShortText    0

        LongText    0

    END Desc
    
    BEGIN Atmosphere
	Inherit          Yes

	BEGIN Absorption

		AbsorptionModel	Simple Satcom

		BEGIN ModelData
			SWVC		    7.500000
			Temperature		293.150000

		END ModelData

	END Absorption

	RainOverride          No
	IsoHeight         2000.000000
	RainRate          1.000000
	RainModelSurfaceTemp		293.150000
    END Atmosphere
    
    BEGIN DisplayTm
		DisplayGT	AlwaysOff
		DisplayType	AlwaysOn
    END DisplayTm
    
    BEGIN Identification
    END Identification
    
    BEGIN Crdn
    END Crdn
    
    BEGIN VO
    END VO
    
    BEGIN PODS
        FacilityID       0
        ElAngCutoff      1.000000e+001
        LocEstimate      No
        UseTransponderDelay      No
        TransponderDelay     0.000000000000e+000
    END PODS

END Extensions

BEGIN SubObjects

END SubObjects

END Facility

