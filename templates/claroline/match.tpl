<assessmentItem xmlns="http://www.imsglobal.org/xsd/imsqti_item_v2p1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsqti_item_v2p1 ./imsqti_item_v2p1.xsd" identifier="{$assessmentitemidentifier}" title="{$assessmentitemtitle}" adaptive="false" timeDependent="false">
	<responseDeclaration identifier="{$questionid}" cardinality="multiple" baseType="directedPair">
		<correctResponse>
		{section name=set loop=$matchsets}
				<value>q{$matchsets[set].id} a{$matchsets[set].id}</value>
		{/section}
		</correctResponse>

		<mapping defaultValue="0">
		{section name=set loop=$matchsets}
		   <mapEntry mapKey="q{$matchsets[set].id} a{$matchsets[set].id}" mappedValue="1"/>
		{/section}
		</mapping>
	</responseDeclaration>
	<outcomeDeclaration identifier="SCORE" cardinality="single" baseType="float"/>

	<itemBody>
		<matchInteraction responseIdentifier="{$questionid}" shuffle="{$shuffle}" maxAssociations="{$setcount}">
			<prompt>{$questionText}</prompt>
			<simpleMatchSet>
			{section name=set loop=$matchsets}
				<simpleAssociableChoice identifier="q{$matchsets[set].id}" matchMax="1">{$matchsets[set].questiontext}</simpleAssociableChoice>
			{/section}
			</simpleMatchSet>
			<simpleMatchSet>
			{section name=set loop=$matchsets}
				<simpleAssociableChoice identifier="a{$matchsets[set].id}" matchMax="{$setcount}">{$matchsets[set].answertext}</simpleAssociableChoice>
			{/section}
			</simpleMatchSet>
		</matchInteraction>
	</itemBody>
	<responseProcessing xmlns="http://www.imsglobal.org/xsd/imsqti_item_v2p1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsqti_item_v2p1 ../imsqti_item_v2p1.xsd">
		<responseCondition>

			<responseIf>
				<isNull>
					<variable identifier="{$questionid}"/>
				</isNull>
				<setOutcomeValue identifier="SCORE">
					<baseValue baseType="integer">0</baseValue>
				</setOutcomeValue>
			</responseIf>

			<responseElse>
				<setOutcomeValue identifier="SCORE">
					<mapResponse identifier="{$questionid}"/>
				</setOutcomeValue>
			</responseElse>
		</responseCondition>
	</responseProcessing>
</assessmentItem>
