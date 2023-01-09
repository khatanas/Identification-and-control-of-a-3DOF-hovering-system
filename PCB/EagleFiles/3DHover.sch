<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="con-hirschmann" urn="urn:adsk.eagle:library:153">
<description>&lt;b&gt;Hirschmann Connectors&lt;/b&gt;&lt;p&gt;
Audio, scart, microphone, headphone&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="MAB5SH" urn="urn:adsk.eagle:footprint:7402/1" library_version="2">
<description>Female &lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
5 pins 90 deg. with shield, horizontal (DIN 41524)</description>
<wire x1="-10.668" y1="-7.62" x2="9.779" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="6.096" y1="8.636" x2="7.112" y2="6.35" width="0.1524" layer="51"/>
<wire x1="8.763" y1="6.35" x2="7.112" y2="6.35" width="0.1524" layer="51"/>
<wire x1="8.763" y1="6.35" x2="9.779" y2="2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-5.715" x2="7.62" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="9.779" y1="-2.159" x2="7.62" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="9.779" y1="-2.159" x2="9.779" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.779" y1="-7.62" x2="9.779" y2="-6.858" width="0.1524" layer="21"/>
<wire x1="10.668" y1="-6.858" x2="9.779" y2="-6.858" width="0.1524" layer="21"/>
<wire x1="10.668" y1="-6.858" x2="10.668" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="10.668" y1="-6.35" x2="9.779" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="9.779" y1="-5.715" x2="9.779" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="9.779" y1="-5.715" x2="7.62" y2="-5.715" width="0.1524" layer="21"/>
<wire x1="7.112" y1="6.35" x2="6.35" y2="6.35" width="0.1524" layer="51"/>
<wire x1="6.35" y1="6.35" x2="3.175" y2="6.35" width="0.1524" layer="51"/>
<wire x1="1.905" y1="6.35" x2="1.905" y2="4.445" width="0.1524" layer="21"/>
<wire x1="6.096" y1="8.636" x2="1.905" y2="8.636" width="0.1524" layer="51"/>
<wire x1="1.905" y1="8.636" x2="0.635" y2="8.636" width="0.1524" layer="21"/>
<wire x1="1.905" y1="8.636" x2="1.905" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="8.636" x2="-1.905" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="8.636" x2="-6.223" y2="8.636" width="0.1524" layer="51"/>
<wire x1="-1.905" y1="6.477" x2="-3.175" y2="6.477" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="6.477" x2="-1.905" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.477" x2="-6.35" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-6.35" y1="6.477" x2="-7.112" y2="6.477" width="0.1524" layer="51"/>
<wire x1="6.35" y1="6.35" x2="6.35" y2="2.54" width="0.1524" layer="51"/>
<wire x1="9.779" y1="2.54" x2="7.62" y2="2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="2.54" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-7.62" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="2.54" x2="-9.779" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-10.668" y1="-7.62" x2="-10.668" y2="-6.858" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-6.858" x2="-10.668" y2="-6.858" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-6.858" x2="-9.525" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-10.668" y1="-6.35" x2="-9.525" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-10.668" y1="-6.35" x2="-10.668" y2="-5.715" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-5.715" x2="-10.668" y2="-5.715" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-5.715" x2="-7.62" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-9.779" y1="-2.159" x2="-7.62" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-9.779" y1="-2.159" x2="-9.779" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-8.763" y1="6.477" x2="-9.779" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-7.112" y1="6.477" x2="-6.223" y2="8.636" width="0.1524" layer="51"/>
<wire x1="-8.763" y1="6.477" x2="-7.112" y2="6.477" width="0.1524" layer="51"/>
<wire x1="7.62" y1="-2.159" x2="7.62" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="7.62" y1="2.54" x2="7.62" y2="1.397" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.397" x2="7.62" y2="-1.397" width="0.1524" layer="51"/>
<wire x1="-7.62" y1="-2.159" x2="-7.62" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="2.54" x2="-7.62" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="1.397" x2="-7.62" y2="-1.397" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="6.477" x2="-3.175" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="6.477" x2="-6.35" y2="6.477" width="0.1524" layer="51"/>
<wire x1="-1.905" y1="4.572" x2="-3.175" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="4.572" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="4.445" x2="3.175" y2="4.445" width="0.1524" layer="21"/>
<wire x1="1.905" y1="4.445" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="6.35" x2="3.175" y2="4.445" width="0.1524" layer="21"/>
<wire x1="3.175" y1="6.35" x2="1.905" y2="6.35" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="7.112" x2="-0.635" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="7.112" x2="-1.905" y2="6.477" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="8.636" x2="-0.635" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="8.636" x2="-1.905" y2="8.636" width="0.1524" layer="21"/>
<wire x1="1.905" y1="7.112" x2="0.635" y2="7.112" width="0.1524" layer="21"/>
<wire x1="1.905" y1="7.112" x2="1.905" y2="6.35" width="0.1524" layer="21"/>
<wire x1="0.635" y1="8.636" x2="0.635" y2="7.112" width="0.1524" layer="21"/>
<wire x1="0.635" y1="8.636" x2="-0.635" y2="8.636" width="0.1524" layer="21"/>
<wire x1="-7.493" y1="-5.715" x2="-3.683" y2="-5.715" width="0.1524" layer="21"/>
<wire x1="-1.397" y1="-5.715" x2="-3.683" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="-1.397" y1="-5.715" x2="1.397" y2="-5.715" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-5.715" x2="1.397" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="3.683" y1="-5.715" x2="7.62" y2="-5.715" width="0.1524" layer="21"/>
<pad name="2" x="0" y="5.08" drill="1.3208" shape="long" rot="R90"/>
<pad name="1" x="7.62" y="5.08" drill="1.3208" shape="octagon"/>
<pad name="3" x="-7.62" y="5.08" drill="1.3208" shape="octagon"/>
<pad name="4" x="5.08" y="7.62" drill="1.3208" shape="octagon"/>
<pad name="5" x="-5.08" y="7.62" drill="1.3208" shape="octagon"/>
<pad name="PE@" x="2.54" y="-5.08" drill="1.3208" shape="octagon"/>
<pad name="PE" x="-2.54" y="-5.08" drill="1.3208" shape="octagon"/>
<text x="-6.096" y="9.144" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.651" y="2.794" size="1.27" layer="21" ratio="10">2</text>
<text x="7.239" y="6.985" size="1.27" layer="21" ratio="10">4</text>
<text x="-8.255" y="6.985" size="1.27" layer="21" ratio="10">5</text>
<text x="-6.223" y="2.794" size="1.27" layer="21" ratio="10">3</text>
<text x="5.08" y="2.794" size="1.27" layer="21" ratio="10">1</text>
<text x="-5.08" y="0" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="4.572" x2="8.001" y2="5.588" layer="51"/>
<rectangle x1="0.635" y1="7.112" x2="5.461" y2="8.128" layer="51"/>
<rectangle x1="-5.461" y1="7.112" x2="-0.635" y2="8.128" layer="51"/>
<rectangle x1="-8.001" y1="4.572" x2="-3.175" y2="5.588" layer="51"/>
<hole x="7.62" y="0" drill="2.794"/>
<hole x="-7.62" y="0" drill="2.794"/>
</package>
</packages>
<packages3d>
<package3d name="MAB5SH" urn="urn:adsk.eagle:package:7443/1" type="box" library_version="2">
<description>Female CONNECTOR
5 pins 90 deg. with shield, horizontal (DIN 41524)</description>
<packageinstances>
<packageinstance name="MAB5SH"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="5P" urn="urn:adsk.eagle:symbol:7401/1" library_version="2">
<wire x1="-3.175" y1="-3.175" x2="-3.81" y2="-2.54" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="-3.81" y1="-2.54" x2="-3.175" y2="-1.905" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="5.08" y1="0.635" x2="5.715" y2="0" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="5.715" y1="0" x2="5.08" y2="-0.635" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="0" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="-5.715" y1="0" x2="-5.08" y2="0.635" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="0" y1="-4.445" x2="0.635" y2="-5.08" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="0.635" y1="-5.08" x2="0" y2="-5.715" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="3.175" y1="-1.905" x2="3.81" y2="-2.54" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="3.81" y1="-2.54" x2="3.175" y2="-3.175" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="-1.27" y1="6.35" x2="1.27" y2="6.35" width="0.1524" layer="94"/>
<wire x1="-10.16" y1="-10.16" x2="10.16" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="10.16" y1="10.16" x2="10.16" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="10.16" y1="10.16" x2="-10.16" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-10.16" y1="-10.16" x2="-10.16" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="0" x2="-5.715" y2="0" width="0.1524" layer="94"/>
<wire x1="-5.08" y1="-2.54" x2="-3.81" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="3.81" y1="-2.54" x2="5.08" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="5.715" y1="0" x2="7.62" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="6.35" x2="-1.27" y2="8.89" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="8.89" x2="1.27" y2="8.89" width="0.1524" layer="94"/>
<wire x1="1.27" y1="8.89" x2="1.27" y2="6.35" width="0.1524" layer="94"/>
<wire x1="0.635" y1="-5.08" x2="7.62" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="0" y1="-8.89" x2="0" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="0" y1="-8.89" x2="-8.89" y2="-8.89" width="0.1524" layer="94"/>
<circle x="0" y="0" radius="7.62" width="0.8128" layer="94"/>
<text x="0" y="10.795" size="1.778" layer="96">&gt;VALUE</text>
<text x="-10.16" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="3.302" y="-0.762" size="1.778" layer="94">1</text>
<text x="-2.032" y="-5.842" size="1.778" layer="94">2</text>
<text x="-4.572" y="-0.762" size="1.778" layer="94">3</text>
<text x="1.143" y="-3.302" size="1.778" layer="94">4</text>
<text x="-2.667" y="-3.429" size="1.778" layer="94">5</text>
<text x="-9.271" y="-8.255" size="1.524" layer="94">PE</text>
<rectangle x1="-1.27" y1="6.35" x2="1.27" y2="8.89" layer="94"/>
<rectangle x1="-1.27" y1="-8.255" x2="1.27" y2="-6.985" layer="94"/>
<pin name="1" x="15.24" y="0" visible="off" direction="pas" swaplevel="2" rot="R180"/>
<pin name="2" x="15.24" y="-5.08" visible="off" direction="pas" swaplevel="2" rot="R180"/>
<pin name="3" x="-15.24" y="0" visible="off" direction="pas" swaplevel="2"/>
<pin name="4" x="12.7" y="-2.54" visible="off" direction="pas" swaplevel="2" rot="R180"/>
<pin name="5" x="-12.7" y="-2.54" visible="off" direction="pas" swaplevel="2"/>
<pin name="PE" x="-12.7" y="-7.62" visible="off" length="short" direction="pwr" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MAB5SH" urn="urn:adsk.eagle:component:7471/2" prefix="X" library_version="2">
<description>Female &lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
5 pins 90 deg. with shield, horizontal (DIN 41524)</description>
<gates>
<gate name="G$1" symbol="5P" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MAB5SH">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="PE" pad="PE PE@"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:7443/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="809883" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="4" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="FC68371">
<packages>
<package name="FC68371_CLF">
<smd name="1" x="0" y="-5" dx="3.008" dy="1.808" layer="16" roundness="100" rot="R90"/>
<smd name="2" x="5" y="0" dx="3.008" dy="1.508" layer="16" roundness="100"/>
<wire x1="0" y1="0" x2="0" y2="2.921" width="0.1524" layer="47"/>
<wire x1="0" y1="2.921" x2="0" y2="3.302" width="0.1524" layer="47"/>
<wire x1="5.0038" y1="0" x2="5.0038" y2="2.921" width="0.1524" layer="47"/>
<wire x1="5.0038" y1="2.921" x2="5.0038" y2="3.302" width="0.1524" layer="47"/>
<wire x1="0" y1="2.921" x2="5.0038" y2="2.921" width="0.1524" layer="47"/>
<wire x1="0" y1="2.921" x2="0.254" y2="3.048" width="0.1524" layer="47"/>
<wire x1="0" y1="2.921" x2="0.254" y2="2.794" width="0.1524" layer="47"/>
<wire x1="0.254" y1="3.048" x2="0.254" y2="2.794" width="0.1524" layer="47"/>
<wire x1="5.0038" y1="2.921" x2="4.7498" y2="3.048" width="0.1524" layer="47"/>
<wire x1="5.0038" y1="2.921" x2="4.7498" y2="2.794" width="0.1524" layer="47"/>
<wire x1="4.7498" y1="3.048" x2="4.7498" y2="2.794" width="0.1524" layer="47"/>
<wire x1="-13.3858" y1="-0.2032" x2="-13.3858" y2="11.176" width="0.1524" layer="47"/>
<wire x1="-13.3858" y1="11.176" x2="-13.3858" y2="11.557" width="0.1524" layer="47"/>
<wire x1="7.62" y1="-0.2032" x2="7.62" y2="11.176" width="0.1524" layer="47"/>
<wire x1="7.62" y1="11.176" x2="7.62" y2="11.557" width="0.1524" layer="47"/>
<wire x1="-13.3858" y1="11.176" x2="7.62" y2="11.176" width="0.1524" layer="47"/>
<wire x1="-13.3858" y1="11.176" x2="-13.1318" y2="11.303" width="0.1524" layer="47"/>
<wire x1="-13.3858" y1="11.176" x2="-13.1318" y2="11.049" width="0.1524" layer="47"/>
<wire x1="-13.1318" y1="11.303" x2="-13.1318" y2="11.049" width="0.1524" layer="47"/>
<wire x1="7.62" y1="11.176" x2="7.366" y2="11.303" width="0.1524" layer="47"/>
<wire x1="7.62" y1="11.176" x2="7.366" y2="11.049" width="0.1524" layer="47"/>
<wire x1="7.366" y1="11.303" x2="7.366" y2="11.049" width="0.1524" layer="47"/>
<wire x1="0" y1="0" x2="10.16" y2="0" width="0.1524" layer="47"/>
<wire x1="10.16" y1="0" x2="10.541" y2="0" width="0.1524" layer="47"/>
<wire x1="0" y1="-5.0038" x2="10.16" y2="-5.0038" width="0.1524" layer="47"/>
<wire x1="10.16" y1="-5.0038" x2="10.541" y2="-5.0038" width="0.1524" layer="47"/>
<wire x1="10.16" y1="0" x2="10.16" y2="-5.0038" width="0.1524" layer="47"/>
<wire x1="10.16" y1="0" x2="10.033" y2="-0.254" width="0.1524" layer="47"/>
<wire x1="10.16" y1="0" x2="10.287" y2="-0.254" width="0.1524" layer="47"/>
<wire x1="10.033" y1="-0.254" x2="10.287" y2="-0.254" width="0.1524" layer="47"/>
<wire x1="10.16" y1="-5.0038" x2="10.033" y2="-4.7498" width="0.1524" layer="47"/>
<wire x1="10.16" y1="-5.0038" x2="10.287" y2="-4.7498" width="0.1524" layer="47"/>
<wire x1="10.033" y1="-4.7498" x2="10.287" y2="-4.7498" width="0.1524" layer="47"/>
<wire x1="-23.7998" y1="-0.2032" x2="-24.1808" y2="-0.2032" width="0.1524" layer="47"/>
<wire x1="-2.8956" y1="-5.0038" x2="-23.7998" y2="-5.0038" width="0.1524" layer="47"/>
<wire x1="-23.7998" y1="-5.0038" x2="-24.1808" y2="-5.0038" width="0.1524" layer="47"/>
<wire x1="-23.7998" y1="-0.2032" x2="-23.7998" y2="-5.0038" width="0.1524" layer="47"/>
<wire x1="-23.7998" y1="-0.2032" x2="-23.9268" y2="-0.4572" width="0.1524" layer="47"/>
<wire x1="-23.7998" y1="-0.2032" x2="-23.6728" y2="-0.4572" width="0.1524" layer="47"/>
<wire x1="-23.9268" y1="-0.4572" x2="-23.6728" y2="-0.4572" width="0.1524" layer="47"/>
<wire x1="-23.7998" y1="-5.0038" x2="-23.9268" y2="-4.7498" width="0.1524" layer="47"/>
<wire x1="-23.7998" y1="-5.0038" x2="-23.6728" y2="-4.7498" width="0.1524" layer="47"/>
<wire x1="-23.9268" y1="-4.7498" x2="-23.6728" y2="-4.7498" width="0.1524" layer="47"/>
<wire x1="-13.3858" y1="-0.2032" x2="-22.5298" y2="-0.2032" width="0.1524" layer="47"/>
<wire x1="-22.5298" y1="-0.2032" x2="-23.7998" y2="-0.2032" width="0.1524" layer="47"/>
<wire x1="-13.3858" y1="-9.8044" x2="-22.5298" y2="-9.8044" width="0.1524" layer="47"/>
<wire x1="-22.5298" y1="-9.8044" x2="-22.9108" y2="-9.8044" width="0.1524" layer="47"/>
<wire x1="-22.5298" y1="-0.2032" x2="-22.5298" y2="-9.8044" width="0.1524" layer="47"/>
<wire x1="-22.5298" y1="-0.2032" x2="-22.6568" y2="-0.4572" width="0.1524" layer="47"/>
<wire x1="-22.5298" y1="-0.2032" x2="-22.4028" y2="-0.4572" width="0.1524" layer="47"/>
<wire x1="-22.6568" y1="-0.4572" x2="-22.4028" y2="-0.4572" width="0.1524" layer="47"/>
<wire x1="-22.5298" y1="-9.8044" x2="-22.6568" y2="-9.5504" width="0.1524" layer="47"/>
<wire x1="-22.5298" y1="-9.8044" x2="-22.4028" y2="-9.5504" width="0.1524" layer="47"/>
<wire x1="-22.6568" y1="-9.5504" x2="-22.4028" y2="-9.5504" width="0.1524" layer="47"/>
<text x="-18.669" y="-14.8336" size="1.27" layer="47" ratio="6" rot="SR0">Default Padstyle: EX60Y60D38P</text>
<text x="-19.431" y="-16.7386" size="1.27" layer="47" ratio="6" rot="SR0">1st Mtg Padstyle: RX80Y110D50P</text>
<text x="-19.6088" y="-18.6436" size="1.27" layer="47" ratio="6" rot="SR0">2nd Mtg Padstyle: RX50Y100D40P</text>
<text x="-19.6088" y="-20.5486" size="1.27" layer="47" ratio="6" rot="SR0">3rd Mtg Padstyle: RX100Y50D40P</text>
<text x="-19.812" y="-22.4536" size="1.27" layer="47" ratio="6" rot="SR0">Left Mtg Padstyle: RX50Y100D30P</text>
<text x="-20.3962" y="-24.3586" size="1.27" layer="47" ratio="6" rot="SR0">Right Mtg Padstyle: RX50Y100D30P</text>
<text x="-17.7038" y="-26.2636" size="1.27" layer="47" ratio="6" rot="SR0">Alt Padstyle 1: OX60Y90D30P</text>
<text x="-17.7038" y="-28.1686" size="1.27" layer="47" ratio="6" rot="SR0">Alt Padstyle 2: OX90Y60D30P</text>
<text x="0.0658" y="3.679" size="0.635" layer="47" ratio="4" rot="SR0">0.197in/5mm</text>
<text x="-6.1722" y="11.684" size="0.635" layer="47" ratio="4" rot="SR0">0.827in/21mm</text>
<text x="10.668" y="-5.3086" size="0.635" layer="47" ratio="4" rot="SR0">0.197in/5mm</text>
<text x="-32.385" y="-2.921" size="0.635" layer="47" ratio="4" rot="SR0">0.189in/4.801mm</text>
<text x="-31.115" y="-5.3086" size="0.635" layer="47" ratio="4" rot="SR0">0.378in/9.601mm</text>
<wire x1="-13.5128" y1="-9.9314" x2="7.747" y2="-9.9314" width="0.1524" layer="21"/>
<wire x1="7.747" y1="-9.9314" x2="7.747" y2="-0.0762" width="0.1524" layer="21"/>
<wire x1="7.747" y1="-0.0762" x2="6.096" y2="-0.0762" width="0.1524" layer="21"/>
<wire x1="-13.5128" y1="-0.0762" x2="-13.5128" y2="-9.9314" width="0.1524" layer="21"/>
<wire x1="3.9116" y1="-0.0762" x2="-13.5128" y2="-0.0762" width="0.1524" layer="21"/>
<wire x1="-14.9098" y1="0" x2="-15.6718" y2="0" width="0.508" layer="21" curve="-180"/>
<wire x1="-15.6718" y1="0" x2="-14.9098" y2="0" width="0.508" layer="21" curve="-180"/>
<text x="-4.6228" y="-5.6388" size="1.27" layer="21" ratio="6" rot="SR0">&gt;Value</text>
<wire x1="-13.3858" y1="-9.8044" x2="7.62" y2="-9.8044" width="0.1524" layer="51"/>
<wire x1="7.62" y1="-9.8044" x2="7.62" y2="-0.2032" width="0.1524" layer="51"/>
<wire x1="7.62" y1="-0.2032" x2="-13.3858" y2="-0.2032" width="0.1524" layer="51"/>
<wire x1="-13.3858" y1="-0.2032" x2="-13.3858" y2="-9.8044" width="0.1524" layer="51"/>
<wire x1="0.381" y1="1.905" x2="-0.381" y2="1.905" width="0.508" layer="51" curve="-180"/>
<wire x1="-0.381" y1="1.905" x2="0.381" y2="1.905" width="0.508" layer="51" curve="-180"/>
<wire x1="-14.9098" y1="0" x2="-15.6718" y2="0" width="0.508" layer="22" curve="-180"/>
<wire x1="-15.6718" y1="0" x2="-14.9098" y2="0" width="0.508" layer="22" curve="-180"/>
<text x="-6.1722" y="-5.6388" size="1.27" layer="27" ratio="6" rot="SR0">&gt;Name</text>
<hole x="-3.35" y="-1.7" drill="1.8"/>
<hole x="0.65" y="-1.7" drill="1.8"/>
<hole x="6.65" y="-1.7" drill="1.8"/>
<hole x="-3.35" y="-8" drill="1.8"/>
<hole x="0.65" y="-8" drill="1.8"/>
<hole x="6.65" y="-8" drill="1.8"/>
<smd name="3" x="0" y="-5" dx="3.008" dy="1.808" layer="1" roundness="100" rot="R270"/>
<smd name="4" x="5" y="0" dx="3.008" dy="1.508" layer="1" roundness="100"/>
</package>
</packages>
<symbols>
<symbol name="FC68371">
<pin name="1" x="2.54" y="0" length="middle" direction="pas"/>
<pin name="2" x="38.1" y="0" length="middle" direction="pas" rot="R180"/>
<wire x1="7.62" y1="5.08" x2="7.62" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="33.02" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="33.02" y1="-5.08" x2="33.02" y2="5.08" width="0.1524" layer="94"/>
<wire x1="33.02" y1="5.08" x2="7.62" y2="5.08" width="0.1524" layer="94"/>
<text x="15.5956" y="9.1186" size="2.0828" layer="95" ratio="6" rot="SR0">&gt;Name</text>
<text x="14.9606" y="6.5786" size="2.0828" layer="96" ratio="6" rot="SR0">&gt;Value</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="FC68371" prefix="U">
<gates>
<gate name="A" symbol="FC68371" x="0" y="0"/>
</gates>
<devices>
<device name="" package="FC68371_CLF">
<connects>
<connect gate="A" pin="1" pad="1 3"/>
<connect gate="A" pin="2" pad="2 4"/>
</connects>
<technologies>
<technology name="">
<attribute name="COPYRIGHT" value="Copyright (C) 2022 Ultra Librarian. All rights reserved." constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="FC68371" constant="no"/>
<attribute name="MFR_NAME" value="Cliff" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1" urn="urn:adsk.eagle:library:371">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND" urn="urn:adsk.eagle:symbol:26925/1" library_version="1">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" urn="urn:adsk.eagle:component:26954/1" prefix="GND" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-panduit" urn="urn:adsk.eagle:library:169">
<description>&lt;b&gt;Panduit Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="057-034-0" urn="urn:adsk.eagle:footprint:9168/1" library_version="2">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
series 057 contact pc board low profile headers&lt;p&gt;
angled</description>
<wire x1="-1.9" y1="-0.23" x2="-1.9" y2="5.86" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="-0.23" x2="1.9" y2="-0.23" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-0.23" x2="1.9" y2="5.86" width="0.2032" layer="21"/>
<wire x1="-21.04" y1="5.22" x2="-20.34" y2="3.25" width="0.4064" layer="21"/>
<wire x1="-20.34" y1="3.25" x2="-19.64" y2="5.22" width="0.4064" layer="21"/>
<wire x1="-19.64" y1="5.22" x2="-21.04" y2="5.22" width="0.4064" layer="21"/>
<wire x1="-25.45" y1="-2.54" x2="-25.45" y2="5.86" width="0.2032" layer="21"/>
<wire x1="25.45" y1="5.86" x2="25.45" y2="-2.44" width="0.2032" layer="21"/>
<wire x1="-25.4" y1="-2.54" x2="-22.86" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="-22.86" y1="-2.54" x2="-22.86" y2="-5.98" width="0.2032" layer="21"/>
<wire x1="25.4" y1="-2.54" x2="22.86" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="22.86" y1="-2.54" x2="22.86" y2="-6.05" width="0.2032" layer="21"/>
<wire x1="22.85" y1="-6.04" x2="-22.85" y2="-6.04" width="0.2032" layer="21"/>
<wire x1="-25.45" y1="5.86" x2="25.45" y2="5.86" width="0.2032" layer="21"/>
<pad name="1" x="-20.32" y="-5.08" drill="1" shape="octagon"/>
<pad name="2" x="-20.32" y="-2.54" drill="1" shape="octagon"/>
<pad name="3" x="-17.78" y="-5.08" drill="1" shape="octagon"/>
<pad name="4" x="-17.78" y="-2.54" drill="1" shape="octagon"/>
<pad name="5" x="-15.24" y="-5.08" drill="1" shape="octagon"/>
<pad name="6" x="-15.24" y="-2.54" drill="1" shape="octagon"/>
<pad name="7" x="-12.7" y="-5.08" drill="1" shape="octagon"/>
<pad name="8" x="-12.7" y="-2.54" drill="1" shape="octagon"/>
<pad name="9" x="-10.16" y="-5.08" drill="1" shape="octagon"/>
<pad name="10" x="-10.16" y="-2.54" drill="1" shape="octagon"/>
<pad name="11" x="-7.62" y="-5.08" drill="1" shape="octagon"/>
<pad name="12" x="-7.62" y="-2.54" drill="1" shape="octagon"/>
<pad name="13" x="-5.08" y="-5.08" drill="1" shape="octagon"/>
<pad name="14" x="-5.08" y="-2.54" drill="1" shape="octagon"/>
<pad name="15" x="-2.54" y="-5.08" drill="1" shape="octagon"/>
<pad name="16" x="-2.54" y="-2.54" drill="1" shape="octagon"/>
<pad name="17" x="0" y="-5.08" drill="1" shape="octagon"/>
<pad name="18" x="0" y="-2.54" drill="1" shape="octagon"/>
<pad name="19" x="2.54" y="-5.08" drill="1" shape="octagon"/>
<pad name="20" x="2.54" y="-2.54" drill="1" shape="octagon"/>
<pad name="21" x="5.08" y="-5.08" drill="1" shape="octagon"/>
<pad name="22" x="5.08" y="-2.54" drill="1" shape="octagon"/>
<pad name="23" x="7.62" y="-5.08" drill="1" shape="octagon"/>
<pad name="24" x="7.62" y="-2.54" drill="1" shape="octagon"/>
<pad name="25" x="10.16" y="-5.08" drill="1" shape="octagon"/>
<pad name="26" x="10.16" y="-2.54" drill="1" shape="octagon"/>
<pad name="27" x="12.7" y="-5.08" drill="1" shape="octagon"/>
<pad name="28" x="12.7" y="-2.54" drill="1" shape="octagon"/>
<pad name="29" x="15.24" y="-5.08" drill="1" shape="octagon"/>
<pad name="30" x="15.24" y="-2.54" drill="1" shape="octagon"/>
<pad name="31" x="17.78" y="-5.08" drill="1" shape="octagon"/>
<pad name="32" x="17.78" y="-2.54" drill="1" shape="octagon"/>
<pad name="33" x="20.32" y="-5.08" drill="1" shape="octagon"/>
<pad name="34" x="20.32" y="-2.54" drill="1" shape="octagon"/>
<text x="-20.32" y="-8.89" size="1.778" layer="25">&gt;NAME</text>
<text x="3.81" y="2.54" size="1.778" layer="27">&gt;VALUE</text>
<hole x="-28.72" y="3.66" drill="2.8"/>
<hole x="28.97" y="3.66" drill="2.8"/>
</package>
<package name="057-034-1" urn="urn:adsk.eagle:footprint:9169/1" library_version="2">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
series 057 contact pc board low profile headers&lt;p&gt;
straight</description>
<wire x1="-1.9" y1="-3.32" x2="-1.9" y2="-4.03" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-3.32" x2="1.9" y2="-4.03" width="0.2032" layer="21"/>
<wire x1="-22.74" y1="-1.97" x2="-22.04" y2="-3.04" width="0.4064" layer="21"/>
<wire x1="-22.04" y1="-3.04" x2="-21.34" y2="-1.97" width="0.4064" layer="21"/>
<wire x1="-21.34" y1="-1.97" x2="-22.74" y2="-1.97" width="0.4064" layer="21"/>
<wire x1="-25.45" y1="-4.1" x2="-25.45" y2="4.1" width="0.2032" layer="21"/>
<wire x1="-25.45" y1="-4.1" x2="25.45" y2="-4.1" width="0.2032" layer="21"/>
<wire x1="25.45" y1="-4.1" x2="25.45" y2="4.1" width="0.2032" layer="21"/>
<wire x1="25.45" y1="4.1" x2="-25.45" y2="4.1" width="0.2032" layer="21"/>
<wire x1="-24.65" y1="-3.3" x2="-24.65" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-24.65" y1="3.3" x2="24.65" y2="3.3" width="0.2032" layer="21"/>
<wire x1="24.65" y1="3.3" x2="24.65" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="24.65" y1="-3.3" x2="1.9" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="-3.3" x2="-24.65" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="-25.45" y1="4.1" x2="-24.65" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-25.45" y1="-4.1" x2="-24.65" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="25.45" y1="4.1" x2="24.65" y2="3.3" width="0.2032" layer="21"/>
<wire x1="24.65" y1="-3.3" x2="25.45" y2="-4.1" width="0.2032" layer="21"/>
<pad name="1" x="-20.32" y="-1.27" drill="1" shape="octagon"/>
<pad name="2" x="-20.32" y="1.27" drill="1" shape="octagon"/>
<pad name="3" x="-17.78" y="-1.27" drill="1" shape="octagon"/>
<pad name="4" x="-17.78" y="1.27" drill="1" shape="octagon"/>
<pad name="5" x="-15.24" y="-1.27" drill="1" shape="octagon"/>
<pad name="6" x="-15.24" y="1.27" drill="1" shape="octagon"/>
<pad name="7" x="-12.7" y="-1.27" drill="1" shape="octagon"/>
<pad name="8" x="-12.7" y="1.27" drill="1" shape="octagon"/>
<pad name="9" x="-10.16" y="-1.27" drill="1" shape="octagon"/>
<pad name="10" x="-10.16" y="1.27" drill="1" shape="octagon"/>
<pad name="11" x="-7.62" y="-1.27" drill="1" shape="octagon"/>
<pad name="12" x="-7.62" y="1.27" drill="1" shape="octagon"/>
<pad name="13" x="-5.08" y="-1.27" drill="1" shape="octagon"/>
<pad name="14" x="-5.08" y="1.27" drill="1" shape="octagon"/>
<pad name="15" x="-2.54" y="-1.27" drill="1" shape="octagon"/>
<pad name="16" x="-2.54" y="1.27" drill="1" shape="octagon"/>
<pad name="17" x="0" y="-1.27" drill="1" shape="octagon"/>
<pad name="18" x="0" y="1.27" drill="1" shape="octagon"/>
<pad name="19" x="2.54" y="-1.27" drill="1" shape="octagon"/>
<pad name="20" x="2.54" y="1.27" drill="1" shape="octagon"/>
<pad name="21" x="5.08" y="-1.27" drill="1" shape="octagon"/>
<pad name="22" x="5.08" y="1.27" drill="1" shape="octagon"/>
<pad name="23" x="7.62" y="-1.27" drill="1" shape="octagon"/>
<pad name="24" x="7.62" y="1.27" drill="1" shape="octagon"/>
<pad name="25" x="10.16" y="-1.27" drill="1" shape="octagon"/>
<pad name="26" x="10.16" y="1.27" drill="1" shape="octagon"/>
<pad name="27" x="12.7" y="-1.27" drill="1" shape="octagon"/>
<pad name="28" x="12.7" y="1.27" drill="1" shape="octagon"/>
<pad name="29" x="15.24" y="-1.27" drill="1" shape="octagon"/>
<pad name="30" x="15.24" y="1.27" drill="1" shape="octagon"/>
<pad name="31" x="17.78" y="-1.27" drill="1" shape="octagon"/>
<pad name="32" x="17.78" y="1.27" drill="1" shape="octagon"/>
<pad name="33" x="20.32" y="-1.27" drill="1" shape="octagon"/>
<pad name="34" x="20.32" y="1.27" drill="1" shape="octagon"/>
<text x="-20.3" y="-6.88" size="1.778" layer="25">&gt;NAME</text>
<text x="-21.05" y="4.55" size="1.778" layer="27">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="057-034-0" urn="urn:adsk.eagle:package:9191/1" type="box" library_version="2">
<description>CONNECTOR
series 057 contact pc board low profile headers
angled</description>
<packageinstances>
<packageinstance name="057-034-0"/>
</packageinstances>
</package3d>
<package3d name="057-034-1" urn="urn:adsk.eagle:package:9188/1" type="box" library_version="2">
<description>CONNECTOR
series 057 contact pc board low profile headers
straight</description>
<packageinstances>
<packageinstance name="057-034-1"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="MV" urn="urn:adsk.eagle:symbol:9158/1" library_version="2">
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<text x="1.016" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-2.54" y="1.905" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M" urn="urn:adsk.eagle:symbol:9159/1" library_version="2">
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<text x="1.016" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="057-034-" urn="urn:adsk.eagle:component:9206/2" prefix="X" library_version="2">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
34-pin series 057 contact pc board low profile headers</description>
<gates>
<gate name="-1" symbol="MV" x="-10.16" y="43.18" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="12.7" y="43.18" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="-10.16" y="38.1" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="12.7" y="38.1" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="-10.16" y="33.02" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="12.7" y="33.02" addlevel="always" swaplevel="1"/>
<gate name="-7" symbol="M" x="-10.16" y="27.94" addlevel="always" swaplevel="1"/>
<gate name="-8" symbol="M" x="12.7" y="27.94" addlevel="always" swaplevel="1"/>
<gate name="-9" symbol="M" x="-10.16" y="22.86" addlevel="always" swaplevel="1"/>
<gate name="-10" symbol="M" x="12.7" y="22.86" addlevel="always" swaplevel="1"/>
<gate name="-11" symbol="M" x="-10.16" y="17.78" addlevel="always" swaplevel="1"/>
<gate name="-12" symbol="M" x="12.7" y="17.78" addlevel="always" swaplevel="1"/>
<gate name="-13" symbol="M" x="-10.16" y="12.7" addlevel="always" swaplevel="1"/>
<gate name="-14" symbol="M" x="12.7" y="12.7" addlevel="always" swaplevel="1"/>
<gate name="-15" symbol="M" x="-10.16" y="7.62" addlevel="always" swaplevel="1"/>
<gate name="-16" symbol="M" x="12.7" y="7.62" addlevel="always" swaplevel="1"/>
<gate name="-17" symbol="M" x="-10.16" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-18" symbol="M" x="12.7" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-19" symbol="M" x="-10.16" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-20" symbol="M" x="12.7" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-21" symbol="M" x="-10.16" y="-7.62" addlevel="always" swaplevel="1"/>
<gate name="-22" symbol="M" x="12.7" y="-7.62" addlevel="always" swaplevel="1"/>
<gate name="-23" symbol="M" x="-10.16" y="-12.7" addlevel="always" swaplevel="1"/>
<gate name="-24" symbol="M" x="12.7" y="-12.7" addlevel="always" swaplevel="1"/>
<gate name="-25" symbol="M" x="-10.16" y="-17.78" addlevel="always" swaplevel="1"/>
<gate name="-26" symbol="M" x="12.7" y="-17.78" addlevel="always" swaplevel="1"/>
<gate name="-27" symbol="M" x="-10.16" y="-22.86" addlevel="always" swaplevel="1"/>
<gate name="-28" symbol="M" x="12.7" y="-22.86" addlevel="always" swaplevel="1"/>
<gate name="-29" symbol="M" x="-10.16" y="-27.94" addlevel="always" swaplevel="1"/>
<gate name="-30" symbol="M" x="12.7" y="-27.94" addlevel="always" swaplevel="1"/>
<gate name="-31" symbol="M" x="-10.16" y="-33.02" addlevel="always" swaplevel="1"/>
<gate name="-32" symbol="M" x="12.7" y="-33.02" addlevel="always" swaplevel="1"/>
<gate name="-33" symbol="M" x="-10.16" y="-38.1" addlevel="always" swaplevel="1"/>
<gate name="-34" symbol="M" x="12.7" y="-38.1" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="0" package="057-034-0">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-17" pin="S" pad="17"/>
<connect gate="-18" pin="S" pad="18"/>
<connect gate="-19" pin="S" pad="19"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-20" pin="S" pad="20"/>
<connect gate="-21" pin="S" pad="21"/>
<connect gate="-22" pin="S" pad="22"/>
<connect gate="-23" pin="S" pad="23"/>
<connect gate="-24" pin="S" pad="24"/>
<connect gate="-25" pin="S" pad="25"/>
<connect gate="-26" pin="S" pad="26"/>
<connect gate="-27" pin="S" pad="27"/>
<connect gate="-28" pin="S" pad="28"/>
<connect gate="-29" pin="S" pad="29"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-30" pin="S" pad="30"/>
<connect gate="-31" pin="S" pad="31"/>
<connect gate="-32" pin="S" pad="32"/>
<connect gate="-33" pin="S" pad="33"/>
<connect gate="-34" pin="S" pad="34"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:9191/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="1" package="057-034-1">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-17" pin="S" pad="17"/>
<connect gate="-18" pin="S" pad="18"/>
<connect gate="-19" pin="S" pad="19"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-20" pin="S" pad="20"/>
<connect gate="-21" pin="S" pad="21"/>
<connect gate="-22" pin="S" pad="22"/>
<connect gate="-23" pin="S" pad="23"/>
<connect gate="-24" pin="S" pad="24"/>
<connect gate="-25" pin="S" pad="25"/>
<connect gate="-26" pin="S" pad="26"/>
<connect gate="-27" pin="S" pad="27"/>
<connect gate="-28" pin="S" pad="28"/>
<connect gate="-29" pin="S" pad="29"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-30" pin="S" pad="30"/>
<connect gate="-31" pin="S" pad="31"/>
<connect gate="-32" pin="S" pad="32"/>
<connect gate="-33" pin="S" pad="33"/>
<connect gate="-34" pin="S" pad="34"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:9188/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0.35" drill="0.5">
<clearance class="0" value="0.5"/>
</class>
<class number="1" name="New Class" width="0" drill="0">
</class>
</classes>
<parts>
<part name="YAW" library="con-hirschmann" library_urn="urn:adsk.eagle:library:153" deviceset="MAB5SH" device="" package3d_urn="urn:adsk.eagle:package:7443/1"/>
<part name="PITCH" library="con-hirschmann" library_urn="urn:adsk.eagle:library:153" deviceset="MAB5SH" device="" package3d_urn="urn:adsk.eagle:package:7443/1"/>
<part name="ROLL" library="con-hirschmann" library_urn="urn:adsk.eagle:library:153" deviceset="MAB5SH" device="" package3d_urn="urn:adsk.eagle:package:7443/1"/>
<part name="FRONT" library="FC68371" deviceset="FC68371" device=""/>
<part name="BACK" library="FC68371" deviceset="FC68371" device=""/>
<part name="RIGHT" library="FC68371" deviceset="FC68371" device=""/>
<part name="LEFT" library="FC68371" deviceset="FC68371" device=""/>
<part name="GND1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND3" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND4" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND5" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="MXB" library="con-panduit" library_urn="urn:adsk.eagle:library:169" deviceset="057-034-" device="1" package3d_urn="urn:adsk.eagle:package:9188/1"/>
<part name="MXA" library="con-panduit" library_urn="urn:adsk.eagle:library:169" deviceset="057-034-" device="1" package3d_urn="urn:adsk.eagle:package:9188/1"/>
<part name="GND7" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND6" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND8" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="YAW" gate="G$1" x="241.3" y="187.96" smashed="yes">
<attribute name="VALUE" x="241.3" y="198.755" size="1.778" layer="96"/>
<attribute name="NAME" x="231.14" y="198.755" size="1.778" layer="95"/>
</instance>
<instance part="PITCH" gate="G$1" x="241.3" y="60.96" smashed="yes">
<attribute name="VALUE" x="241.3" y="71.755" size="1.778" layer="96"/>
<attribute name="NAME" x="231.14" y="71.755" size="1.778" layer="95"/>
</instance>
<instance part="ROLL" gate="G$1" x="241.3" y="162.56" smashed="yes">
<attribute name="VALUE" x="241.3" y="173.355" size="1.778" layer="96"/>
<attribute name="NAME" x="231.14" y="173.355" size="1.778" layer="95"/>
</instance>
<instance part="FRONT" gate="A" x="35.56" y="180.34" smashed="yes">
<attribute name="NAME" x="51.1556" y="189.4586" size="2.0828" layer="95" ratio="6" rot="SR0"/>
<attribute name="VALUE" x="50.5206" y="186.9186" size="2.0828" layer="96" ratio="6" rot="SR0"/>
</instance>
<instance part="BACK" gate="A" x="35.56" y="162.56" smashed="yes">
<attribute name="NAME" x="51.1556" y="171.6786" size="2.0828" layer="95" ratio="6" rot="SR0"/>
<attribute name="VALUE" x="50.5206" y="169.1386" size="2.0828" layer="96" ratio="6" rot="SR0"/>
</instance>
<instance part="RIGHT" gate="A" x="35.56" y="68.58" smashed="yes">
<attribute name="NAME" x="51.1556" y="77.6986" size="2.0828" layer="95" ratio="6" rot="SR0"/>
<attribute name="VALUE" x="50.5206" y="75.1586" size="2.0828" layer="96" ratio="6" rot="SR0"/>
</instance>
<instance part="LEFT" gate="A" x="35.56" y="50.8" smashed="yes">
<attribute name="NAME" x="51.1556" y="59.9186" size="2.0828" layer="95" ratio="6" rot="SR0"/>
<attribute name="VALUE" x="50.5206" y="57.3786" size="2.0828" layer="96" ratio="6" rot="SR0"/>
</instance>
<instance part="GND1" gate="1" x="35.56" y="144.78" smashed="yes">
<attribute name="VALUE" x="33.02" y="142.24" size="1.778" layer="96"/>
</instance>
<instance part="GND2" gate="1" x="35.56" y="38.1" smashed="yes">
<attribute name="VALUE" x="33.02" y="35.56" size="1.778" layer="96"/>
</instance>
<instance part="GND3" gate="1" x="264.16" y="142.24" smashed="yes">
<attribute name="VALUE" x="261.62" y="139.7" size="1.778" layer="96"/>
</instance>
<instance part="GND4" gate="1" x="264.16" y="45.72" smashed="yes">
<attribute name="VALUE" x="261.62" y="43.18" size="1.778" layer="96"/>
</instance>
<instance part="GND5" gate="1" x="157.48" y="121.92" smashed="yes">
<attribute name="VALUE" x="162.56" y="121.92" size="1.778" layer="96"/>
</instance>
<instance part="MXB" gate="-1" x="124.46" y="99.06" smashed="yes">
<attribute name="NAME" x="125.476" y="98.298" size="1.524" layer="95"/>
<attribute name="VALUE" x="124.46" y="100.965" size="1.778" layer="96"/>
</instance>
<instance part="MXB" gate="-2" x="147.32" y="99.06" smashed="yes">
<attribute name="NAME" x="148.336" y="98.298" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-3" x="124.46" y="93.98" smashed="yes">
<attribute name="NAME" x="125.476" y="93.218" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-4" x="147.32" y="93.98" smashed="yes">
<attribute name="NAME" x="148.336" y="93.218" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-5" x="124.46" y="88.9" smashed="yes">
<attribute name="NAME" x="125.476" y="88.138" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-6" x="147.32" y="88.9" smashed="yes">
<attribute name="NAME" x="148.336" y="88.138" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-7" x="124.46" y="83.82" smashed="yes">
<attribute name="NAME" x="125.476" y="83.058" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-8" x="147.32" y="83.82" smashed="yes">
<attribute name="NAME" x="148.336" y="83.058" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-9" x="124.46" y="78.74" smashed="yes">
<attribute name="NAME" x="125.476" y="77.978" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-10" x="147.32" y="78.74" smashed="yes">
<attribute name="NAME" x="148.336" y="77.978" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-11" x="124.46" y="73.66" smashed="yes">
<attribute name="NAME" x="125.476" y="72.898" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-12" x="147.32" y="73.66" smashed="yes">
<attribute name="NAME" x="148.336" y="72.898" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-13" x="124.46" y="68.58" smashed="yes">
<attribute name="NAME" x="125.476" y="67.818" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-14" x="147.32" y="68.58" smashed="yes">
<attribute name="NAME" x="148.336" y="67.818" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-15" x="124.46" y="63.5" smashed="yes">
<attribute name="NAME" x="125.476" y="62.738" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-16" x="147.32" y="63.5" smashed="yes">
<attribute name="NAME" x="148.336" y="62.738" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-17" x="124.46" y="58.42" smashed="yes">
<attribute name="NAME" x="125.476" y="57.658" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-18" x="147.32" y="58.42" smashed="yes">
<attribute name="NAME" x="148.336" y="57.658" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-19" x="124.46" y="53.34" smashed="yes">
<attribute name="NAME" x="125.476" y="52.578" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-20" x="147.32" y="53.34" smashed="yes">
<attribute name="NAME" x="148.336" y="52.578" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-21" x="124.46" y="48.26" smashed="yes">
<attribute name="NAME" x="125.476" y="47.498" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-22" x="147.32" y="48.26" smashed="yes">
<attribute name="NAME" x="148.336" y="47.498" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-23" x="124.46" y="43.18" smashed="yes">
<attribute name="NAME" x="125.476" y="42.418" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-24" x="147.32" y="43.18" smashed="yes">
<attribute name="NAME" x="148.336" y="42.418" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-25" x="124.46" y="38.1" smashed="yes">
<attribute name="NAME" x="125.476" y="37.338" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-26" x="147.32" y="38.1" smashed="yes">
<attribute name="NAME" x="148.336" y="37.338" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-27" x="124.46" y="33.02" smashed="yes">
<attribute name="NAME" x="125.476" y="32.258" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-28" x="147.32" y="33.02" smashed="yes">
<attribute name="NAME" x="148.336" y="32.258" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-29" x="124.46" y="27.94" smashed="yes">
<attribute name="NAME" x="125.476" y="27.178" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-30" x="147.32" y="27.94" smashed="yes">
<attribute name="NAME" x="148.336" y="27.178" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-31" x="124.46" y="22.86" smashed="yes">
<attribute name="NAME" x="125.476" y="22.098" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-32" x="147.32" y="22.86" smashed="yes">
<attribute name="NAME" x="148.336" y="22.098" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-33" x="124.46" y="17.78" smashed="yes">
<attribute name="NAME" x="125.476" y="17.018" size="1.524" layer="95"/>
</instance>
<instance part="MXB" gate="-34" x="147.32" y="17.78" smashed="yes">
<attribute name="NAME" x="148.336" y="17.018" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-1" x="124.46" y="210.82" smashed="yes">
<attribute name="NAME" x="125.476" y="210.058" size="1.524" layer="95"/>
<attribute name="VALUE" x="121.92" y="212.725" size="1.778" layer="96"/>
</instance>
<instance part="MXA" gate="-2" x="147.32" y="210.82" smashed="yes">
<attribute name="NAME" x="148.336" y="210.058" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-3" x="124.46" y="205.74" smashed="yes">
<attribute name="NAME" x="125.476" y="204.978" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-4" x="147.32" y="205.74" smashed="yes">
<attribute name="NAME" x="148.336" y="204.978" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-5" x="124.46" y="200.66" smashed="yes">
<attribute name="NAME" x="125.476" y="199.898" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-6" x="147.32" y="200.66" smashed="yes">
<attribute name="NAME" x="148.336" y="199.898" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-7" x="124.46" y="195.58" smashed="yes">
<attribute name="NAME" x="125.476" y="194.818" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-8" x="147.32" y="195.58" smashed="yes">
<attribute name="NAME" x="148.336" y="194.818" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-9" x="124.46" y="190.5" smashed="yes">
<attribute name="NAME" x="125.476" y="189.738" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-10" x="147.32" y="190.5" smashed="yes">
<attribute name="NAME" x="148.336" y="189.738" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-11" x="124.46" y="185.42" smashed="yes">
<attribute name="NAME" x="125.476" y="184.658" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-12" x="147.32" y="185.42" smashed="yes">
<attribute name="NAME" x="148.336" y="184.658" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-13" x="124.46" y="180.34" smashed="yes">
<attribute name="NAME" x="125.476" y="179.578" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-14" x="147.32" y="180.34" smashed="yes">
<attribute name="NAME" x="148.336" y="179.578" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-15" x="124.46" y="175.26" smashed="yes">
<attribute name="NAME" x="125.476" y="174.498" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-16" x="147.32" y="175.26" smashed="yes">
<attribute name="NAME" x="148.336" y="174.498" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-17" x="124.46" y="170.18" smashed="yes">
<attribute name="NAME" x="125.476" y="169.418" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-18" x="147.32" y="170.18" smashed="yes">
<attribute name="NAME" x="148.336" y="169.418" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-19" x="124.46" y="165.1" smashed="yes">
<attribute name="NAME" x="125.476" y="164.338" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-20" x="147.32" y="165.1" smashed="yes">
<attribute name="NAME" x="148.336" y="164.338" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-21" x="124.46" y="160.02" smashed="yes">
<attribute name="NAME" x="125.476" y="159.258" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-22" x="147.32" y="160.02" smashed="yes">
<attribute name="NAME" x="148.336" y="159.258" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-23" x="124.46" y="154.94" smashed="yes">
<attribute name="NAME" x="125.476" y="154.178" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-24" x="147.32" y="154.94" smashed="yes">
<attribute name="NAME" x="148.336" y="154.178" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-25" x="124.46" y="149.86" smashed="yes">
<attribute name="NAME" x="125.476" y="149.098" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-26" x="147.32" y="149.86" smashed="yes">
<attribute name="NAME" x="148.336" y="149.098" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-27" x="124.46" y="144.78" smashed="yes">
<attribute name="NAME" x="125.476" y="144.018" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-28" x="147.32" y="144.78" smashed="yes">
<attribute name="NAME" x="148.336" y="144.018" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-29" x="124.46" y="139.7" smashed="yes">
<attribute name="NAME" x="125.476" y="138.938" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-30" x="147.32" y="139.7" smashed="yes">
<attribute name="NAME" x="148.336" y="138.938" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-31" x="124.46" y="134.62" smashed="yes">
<attribute name="NAME" x="125.476" y="133.858" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-32" x="147.32" y="134.62" smashed="yes">
<attribute name="NAME" x="148.336" y="133.858" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-33" x="124.46" y="129.54" smashed="yes">
<attribute name="NAME" x="125.476" y="128.778" size="1.524" layer="95"/>
</instance>
<instance part="MXA" gate="-34" x="147.32" y="129.54" smashed="yes">
<attribute name="NAME" x="148.336" y="128.778" size="1.524" layer="95"/>
</instance>
<instance part="GND7" gate="1" x="157.48" y="10.16" smashed="yes">
<attribute name="VALUE" x="154.94" y="7.62" size="1.778" layer="96"/>
</instance>
<instance part="GND6" gate="1" x="228.6" y="142.24" smashed="yes">
<attribute name="VALUE" x="226.06" y="139.7" size="1.778" layer="96"/>
</instance>
<instance part="GND8" gate="1" x="228.6" y="45.72" smashed="yes">
<attribute name="VALUE" x="226.06" y="43.18" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="AO0_A" class="0">
<segment>
<pinref part="FRONT" gate="A" pin="2"/>
<label x="78.74" y="182.88" size="1.778" layer="95"/>
<wire x1="73.66" y1="180.34" x2="86.36" y2="180.34" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="MXA" gate="-2" pin="S"/>
<wire x1="142.24" y1="210.82" x2="177.8" y2="210.82" width="0.1524" layer="91"/>
<label x="172.72" y="213.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="AO1_A" class="0">
<segment>
<pinref part="MXA" gate="-4" pin="S"/>
<wire x1="142.24" y1="205.74" x2="177.8" y2="205.74" width="0.1524" layer="91"/>
<label x="172.72" y="208.28" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="BACK" gate="A" pin="2"/>
<label x="78.74" y="165.1" size="1.778" layer="95"/>
<wire x1="73.66" y1="162.56" x2="86.36" y2="162.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CHA_YAW" class="0">
<segment>
<pinref part="YAW" gate="G$1" pin="3"/>
<label x="203.2" y="190.5" size="1.778" layer="95"/>
<wire x1="226.06" y1="187.96" x2="203.2" y2="187.96" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="MXA" gate="-11" pin="S"/>
<wire x1="119.38" y1="185.42" x2="104.14" y2="185.42" width="0.1524" layer="91"/>
<label x="101.6" y="187.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="CHB_YAW" class="0">
<segment>
<pinref part="YAW" gate="G$1" pin="5"/>
<wire x1="228.6" y1="185.42" x2="203.2" y2="185.42" width="0.1524" layer="91"/>
<label x="203.2" y="182.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="MXA" gate="-13" pin="S"/>
<wire x1="119.38" y1="180.34" x2="104.14" y2="180.34" width="0.1524" layer="91"/>
<label x="101.6" y="182.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="AO0_B" class="0">
<segment>
<pinref part="RIGHT" gate="A" pin="2"/>
<label x="78.74" y="71.12" size="1.778" layer="95"/>
<wire x1="73.66" y1="68.58" x2="86.36" y2="68.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="MXB" gate="-2" pin="S"/>
<wire x1="142.24" y1="99.06" x2="177.8" y2="99.06" width="0.1524" layer="91"/>
<label x="172.72" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="AO1_B" class="0">
<segment>
<pinref part="LEFT" gate="A" pin="2"/>
<label x="78.74" y="53.34" size="1.778" layer="95"/>
<wire x1="73.66" y1="50.8" x2="86.36" y2="50.8" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="MXB" gate="-4" pin="S"/>
<wire x1="142.24" y1="93.98" x2="177.8" y2="93.98" width="0.1524" layer="91"/>
<label x="172.72" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="CHA_PITCH" class="0">
<segment>
<pinref part="MXB" gate="-18" pin="S"/>
<wire x1="142.24" y1="58.42" x2="177.8" y2="58.42" width="0.1524" layer="91"/>
<label x="172.72" y="60.96" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PITCH" gate="G$1" pin="3"/>
<wire x1="226.06" y1="60.96" x2="213.36" y2="60.96" width="0.1524" layer="91"/>
<label x="213.36" y="63.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="CHB_PITCH" class="0">
<segment>
<pinref part="MXB" gate="-22" pin="S"/>
<wire x1="142.24" y1="48.26" x2="177.8" y2="48.26" width="0.1524" layer="91"/>
<label x="172.72" y="50.8" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PITCH" gate="G$1" pin="5"/>
<wire x1="228.6" y1="58.42" x2="213.36" y2="58.42" width="0.1524" layer="91"/>
<label x="213.36" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="FRONT" gate="A" pin="1"/>
<wire x1="35.56" y1="180.34" x2="35.56" y2="162.56" width="0.1524" layer="91"/>
<pinref part="BACK" gate="A" pin="1"/>
<wire x1="35.56" y1="180.34" x2="38.1" y2="180.34" width="0.1524" layer="91"/>
<wire x1="38.1" y1="162.56" x2="35.56" y2="162.56" width="0.1524" layer="91"/>
<wire x1="35.56" y1="162.56" x2="35.56" y2="147.32" width="0.1524" layer="91"/>
<junction x="35.56" y="162.56"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="RIGHT" gate="A" pin="1"/>
<wire x1="38.1" y1="68.58" x2="35.56" y2="68.58" width="0.1524" layer="91"/>
<wire x1="35.56" y1="68.58" x2="35.56" y2="50.8" width="0.1524" layer="91"/>
<pinref part="LEFT" gate="A" pin="1"/>
<wire x1="35.56" y1="50.8" x2="38.1" y2="50.8" width="0.1524" layer="91"/>
<wire x1="35.56" y1="50.8" x2="35.56" y2="40.64" width="0.1524" layer="91"/>
<junction x="35.56" y="50.8"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="ROLL" gate="G$1" pin="1"/>
<wire x1="256.54" y1="162.56" x2="264.16" y2="162.56" width="0.1524" layer="91"/>
<wire x1="264.16" y1="162.56" x2="264.16" y2="187.96" width="0.1524" layer="91"/>
<pinref part="YAW" gate="G$1" pin="1"/>
<wire x1="256.54" y1="187.96" x2="264.16" y2="187.96" width="0.1524" layer="91"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="264.16" y1="162.56" x2="264.16" y2="144.78" width="0.1524" layer="91"/>
<junction x="264.16" y="162.56"/>
</segment>
<segment>
<pinref part="GND4" gate="1" pin="GND"/>
<pinref part="PITCH" gate="G$1" pin="1"/>
<wire x1="256.54" y1="60.96" x2="264.16" y2="60.96" width="0.1524" layer="91"/>
<wire x1="264.16" y1="60.96" x2="264.16" y2="48.26" width="0.1524" layer="91"/>
<junction x="264.16" y="48.26"/>
<wire x1="264.16" y1="53.34" x2="264.16" y2="48.26" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="PITCH" gate="G$1" pin="PE"/>
<wire x1="228.6" y1="53.34" x2="228.6" y2="48.26" width="0.1524" layer="91"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="YAW" gate="G$1" pin="PE"/>
<pinref part="ROLL" gate="G$1" pin="PE"/>
<wire x1="228.6" y1="180.34" x2="228.6" y2="154.94" width="0.1524" layer="91"/>
<wire x1="228.6" y1="154.94" x2="228.6" y2="144.78" width="0.1524" layer="91"/>
<junction x="228.6" y="154.94"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="MXA" gate="-6" pin="S"/>
<wire x1="142.24" y1="200.66" x2="157.48" y2="200.66" width="0.1524" layer="91"/>
<wire x1="157.48" y1="200.66" x2="157.48" y2="195.58" width="0.1524" layer="91"/>
<pinref part="MXA" gate="-8" pin="S"/>
<wire x1="157.48" y1="195.58" x2="157.48" y2="185.42" width="0.1524" layer="91"/>
<wire x1="157.48" y1="185.42" x2="157.48" y2="175.26" width="0.1524" layer="91"/>
<wire x1="157.48" y1="175.26" x2="157.48" y2="165.1" width="0.1524" layer="91"/>
<wire x1="157.48" y1="165.1" x2="157.48" y2="154.94" width="0.1524" layer="91"/>
<wire x1="157.48" y1="154.94" x2="157.48" y2="144.78" width="0.1524" layer="91"/>
<wire x1="157.48" y1="144.78" x2="157.48" y2="139.7" width="0.1524" layer="91"/>
<wire x1="157.48" y1="139.7" x2="157.48" y2="124.46" width="0.1524" layer="91"/>
<wire x1="142.24" y1="195.58" x2="157.48" y2="195.58" width="0.1524" layer="91"/>
<junction x="157.48" y="195.58"/>
<pinref part="MXA" gate="-12" pin="S"/>
<wire x1="142.24" y1="185.42" x2="157.48" y2="185.42" width="0.1524" layer="91"/>
<junction x="157.48" y="185.42"/>
<pinref part="MXA" gate="-16" pin="S"/>
<wire x1="142.24" y1="175.26" x2="157.48" y2="175.26" width="0.1524" layer="91"/>
<junction x="157.48" y="175.26"/>
<pinref part="MXA" gate="-24" pin="S"/>
<wire x1="142.24" y1="154.94" x2="157.48" y2="154.94" width="0.1524" layer="91"/>
<junction x="157.48" y="154.94"/>
<pinref part="MXA" gate="-28" pin="S"/>
<wire x1="142.24" y1="144.78" x2="157.48" y2="144.78" width="0.1524" layer="91"/>
<junction x="157.48" y="144.78"/>
<pinref part="MXA" gate="-30" pin="S"/>
<wire x1="142.24" y1="139.7" x2="157.48" y2="139.7" width="0.1524" layer="91"/>
<junction x="157.48" y="139.7"/>
<pinref part="GND5" gate="1" pin="GND"/>
<pinref part="MXA" gate="-20" pin="S"/>
<wire x1="142.24" y1="165.1" x2="157.48" y2="165.1" width="0.1524" layer="91"/>
<junction x="157.48" y="165.1"/>
</segment>
<segment>
<pinref part="MXB" gate="-6" pin="S"/>
<wire x1="142.24" y1="88.9" x2="157.48" y2="88.9" width="0.1524" layer="91"/>
<wire x1="157.48" y1="88.9" x2="157.48" y2="83.82" width="0.1524" layer="91"/>
<pinref part="MXB" gate="-8" pin="S"/>
<wire x1="157.48" y1="83.82" x2="157.48" y2="73.66" width="0.1524" layer="91"/>
<wire x1="157.48" y1="73.66" x2="157.48" y2="63.5" width="0.1524" layer="91"/>
<wire x1="157.48" y1="63.5" x2="157.48" y2="53.34" width="0.1524" layer="91"/>
<wire x1="157.48" y1="53.34" x2="157.48" y2="43.18" width="0.1524" layer="91"/>
<wire x1="157.48" y1="43.18" x2="157.48" y2="33.02" width="0.1524" layer="91"/>
<wire x1="157.48" y1="33.02" x2="157.48" y2="27.94" width="0.1524" layer="91"/>
<wire x1="157.48" y1="27.94" x2="157.48" y2="12.7" width="0.1524" layer="91"/>
<wire x1="142.24" y1="83.82" x2="157.48" y2="83.82" width="0.1524" layer="91"/>
<junction x="157.48" y="83.82"/>
<pinref part="MXB" gate="-12" pin="S"/>
<wire x1="142.24" y1="73.66" x2="157.48" y2="73.66" width="0.1524" layer="91"/>
<junction x="157.48" y="73.66"/>
<pinref part="MXB" gate="-16" pin="S"/>
<wire x1="142.24" y1="63.5" x2="157.48" y2="63.5" width="0.1524" layer="91"/>
<junction x="157.48" y="63.5"/>
<pinref part="MXB" gate="-24" pin="S"/>
<wire x1="142.24" y1="43.18" x2="157.48" y2="43.18" width="0.1524" layer="91"/>
<junction x="157.48" y="43.18"/>
<pinref part="MXB" gate="-28" pin="S"/>
<wire x1="142.24" y1="33.02" x2="157.48" y2="33.02" width="0.1524" layer="91"/>
<junction x="157.48" y="33.02"/>
<pinref part="MXB" gate="-30" pin="S"/>
<wire x1="142.24" y1="27.94" x2="157.48" y2="27.94" width="0.1524" layer="91"/>
<junction x="157.48" y="27.94"/>
<pinref part="GND7" gate="1" pin="GND"/>
<pinref part="MXB" gate="-20" pin="S"/>
<wire x1="142.24" y1="53.34" x2="157.48" y2="53.34" width="0.1524" layer="91"/>
<junction x="157.48" y="53.34"/>
</segment>
</net>
<net name="CHA_ROLL" class="0">
<segment>
<pinref part="MXA" gate="-18" pin="S"/>
<wire x1="142.24" y1="170.18" x2="177.8" y2="170.18" width="0.1524" layer="91"/>
<label x="172.72" y="172.72" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ROLL" gate="G$1" pin="3"/>
<wire x1="226.06" y1="162.56" x2="203.2" y2="162.56" width="0.1524" layer="91"/>
<label x="203.2" y="165.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="CHB_ROLL" class="0">
<segment>
<pinref part="MXA" gate="-22" pin="S"/>
<wire x1="142.24" y1="160.02" x2="177.8" y2="160.02" width="0.1524" layer="91"/>
<label x="172.72" y="162.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ROLL" gate="G$1" pin="5"/>
<wire x1="228.6" y1="160.02" x2="203.2" y2="160.02" width="0.1524" layer="91"/>
<label x="203.2" y="157.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="5V" class="0">
<segment>
<pinref part="MXA" gate="-1" pin="S"/>
<wire x1="119.38" y1="210.82" x2="104.14" y2="210.82" width="0.1524" layer="91"/>
<label x="101.6" y="213.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="MXB" gate="-1" pin="S"/>
<wire x1="119.38" y1="99.06" x2="104.14" y2="99.06" width="0.1524" layer="91"/>
<label x="104.14" y="101.6" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PITCH" gate="G$1" pin="4"/>
<wire x1="254" y1="58.42" x2="259.08" y2="58.42" width="0.1524" layer="91"/>
<label x="266.7" y="73.66" size="1.778" layer="95"/>
<wire x1="259.08" y1="58.42" x2="259.08" y2="71.12" width="0.1524" layer="91"/>
<wire x1="259.08" y1="71.12" x2="269.24" y2="71.12" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="259.08" y1="198.12" x2="259.08" y2="185.42" width="0.1524" layer="91"/>
<pinref part="ROLL" gate="G$1" pin="4"/>
<wire x1="259.08" y1="185.42" x2="259.08" y2="160.02" width="0.1524" layer="91"/>
<wire x1="259.08" y1="160.02" x2="254" y2="160.02" width="0.1524" layer="91"/>
<wire x1="259.08" y1="198.12" x2="276.86" y2="198.12" width="0.1524" layer="91"/>
<label x="274.32" y="200.66" size="1.778" layer="95"/>
<pinref part="YAW" gate="G$1" pin="4"/>
<wire x1="259.08" y1="185.42" x2="254" y2="185.42" width="0.1524" layer="91"/>
<junction x="259.08" y="185.42"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
