Return-Path: <bounces+840901-6e2d-openbmc=lists.ozlabs.org@meeting.bluejeans.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=meeting.bluejeans.com (client-ip=192.254.112.36;
 helo=o2.meeting.bluejeans.com;
 envelope-from=bounces+840901-6e2d-openbmc=lists.ozlabs.org@meeting.bluejeans.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bluejeans.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bluejeans.com header.i=@bluejeans.com
 header.b="ai70joB+"; dkim-atps=neutral
X-Greylist: delayed 321 seconds by postgrey-1.36 at bilbo;
 Tue, 13 Mar 2018 03:54:07 AEDT
Received: from o2.meeting.bluejeans.com (o2.meeting.bluejeans.com
 [192.254.112.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400PG75DB6zF0hr
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 03:54:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=bluejeans.com; 
 h=from:to:subject:mime-version:content-type:reply-to; s=smtpapi; 
 bh=KeEujbd0PxCv+NRnUP9P+Ma34j4=; b=ai70joB+JJJIk44S+zuBt7G6+G//q
 sO83kejPHLFb4W4GNGv6hifwv/Ag1TDx/rOfRqkJ1I03SkE/z6vrjlWDyEZ4tqgp
 WXaUoAs6caIm5gUrzJntDOOAT0UGxMJ+Hz5G1n/674xYZovNtSy7wQkZxsbVYOFn
 fRRLN9cjXP9d+c=
Received: by filter1211p1mdw1.sendgrid.net with SMTP id
 filter1211p1mdw1-28684-5AA6AF66-15
 2018-03-12 16:48:38.354218431 +0000 UTC
Received: from sj1-app-102-17 (bjn-sj1-fw.bluejeansnet.com [64.215.152.5])
 by ismtpd0024p1las1.sendgrid.net (SG) with ESMTP id _t6eC_XrT-SmOGqqi1Xd9w
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 16:48:37.940 +0000 (UTC)
Date: Mon, 12 Mar 2018 16:48:38 +0000 (UTC)
From: Ed Tanous via BlueJeans Network <invite@bluejeans.com>
To: openbmc@lists.ozlabs.org
Message-ID: <85503096.346361520873318075.JavaMail.denimuser@sj1-app-102-17>
Subject: OpenBMC Redfish working group working call
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_103902_842669971.1520873317825"
Reply-To: "Ed Tanous" <ed.tanous@intel.com>
X-SG-EID: GLIZiYh64uL5cx/DdhkvsgERvRd4UJ/5shd1zflxZCiv7JAJeOokr14ixTHHF8uA8wPEl4AzHzGLES
 eSdD39eXww2QeWaA4IxMc2ZYOddrYa5h4A+zEM9szzgClELBHeIFuBPOoK0P07qNcS2/ulbdmVtynv
 LbFtRXGFdh+VwT9e297Nx8ONfS8oocDUs29rpnnYPGrCAht3Jb4HherupeyEpEENEiZihZG4UzxnNI
 ow+KdikI9xoyByYsYlnQ9s
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Mar 2018 16:54:08 -0000

------=_Part_103902_842669971.1520873317825
Content-Type: multipart/related; 
	boundary="----=_Part_103903_1324055737.1520873317825"

------=_Part_103903_1324055737.1520873317825
Content-Type: multipart/alternative; 
	boundary="----=_Part_103904_1086371066.1520873317825"

------=_Part_103904_1086371066.1520873317825
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: quoted-printable

To join the meeting on a computer or mobile phone: https://bluejeans.com/92=
3058766?src=3DtextEmail

Ed Tanous has invited you to a video meeting.
------------------------------------------------
Phone Dial-in
+1.408.740.7256 (United States)
+1.408.317.9253 (Alternate number)
Global Numbers: http://bluejeans.com/numbers

Meeting ID: 923 058 766

Room System
199.48.152.152 or bjn.vc

Meeting ID: 923 058 766
------------------------------------------------
Description:
This meeting invite supersedes the one from Michael Brown, as he will not b=
e able to attend.

Per meeting decision, this meeting invite is for the =E2=80=9COpenBMC Redfi=
sh working group=E2=80=9D. This working group will meet every Monday at 4pm=
 CST and publish meeting minutes to the mailing list. The working group is =
open to anybody who would like to participate in development of Redfish on =
OpenBMC.
=20
Upcoming Meeting Agenda
        2018-03-05: Ed Tanous (Intel) to go over =E2=80=98bmcweb=E2=80=99 r=
equirements and implementation. Depending on time, Michael Brown (Dell) to =
start going over go-redfish requirements and implementation.
        2018-03-12: Michael Brown (Dell) on vacation. (May need some altern=
ative host for this meeting depending on if I can dial in from Iceland).
        2018-03-19: Paul Vancil to discuss python implementation
        2018-03-26: open
=20
Past meetings:
        Meeting Minutes 2018-02-26: https://lists.ozlabs.org/pipermail/open=
bmc/2018-February/010955.html
=20

------------------------------------------------
Want to test your video connection?
https://bluejeans.com/111




------=_Part_103904_1086371066.1520873317825
Content-Type: text/html;charset="utf-8"
Content-Transfer-Encoding: quoted-printable



        <table width=3D"100%">
            <tr bgcolor=3D"#ffffff">
                <td align=3D"center">
                    <table width=3D"600" bgcolor=3D"#FFFFFF" style=3D"margi=
n-top:20px;padding:20px 50px 10px 50px;margin-bottom:20px;text-align:left;b=
order: 1px solid #d8d8d8">
        <tr>
            <td style=3D"padding-right:10px;padding-bottom:20px;">
                <a href=3D"http://bluejeans.com">
                    <img src=3D"https://static.bluejeans.com/z1/static/imag=
es/bjn/BlueJeans_Logo.png" alt=3D"Blue Jeans" style=3D"border:none;">
                </a>
            </td>
        </tr>
                        <tr>
                            <td style=3D"font-size: 20px;color: #333333; pa=
dding-bottom:20px;">
                                <a href=3D"mailto:ed.tanous@intel.com">Ed T=
anous</a> has invited you to a video meeting. <br>



                            </td>
                        </tr>


=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

                        <tr>
                            <td style=3D"padding-top:20px; padding-bottom: =
20px;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
                <table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
                    <tbody>
                        <tr height=3D"50">
                            <td width=3D"200" height=3D"50" align=3D"center=
" valign=3D"middle" style=3D"color:#FFFFFF;background:#0b88e6;">
                                <a href=3D"https://bluejeans.com/923058766?=
src=3DhtmlEmail" style=3D"font-family:Helvetica,sans-serif;border-radius:2p=
x;background:#0b88e6;height:50px;line-height: 50px;text-align:center;color:=
#fff;font-size:16px;width: 200px;font-weight:bold;margin:auto;display:inlin=
e-block;padding:0 20px;text-decoration:none;" target=3D"_blank">
                                    Join Meeting
				                </a>
                            </td>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
                            <td height=3D"30"></td>
                        </tr>
                        <tr>
                            <td width=3D"201">
                                <span>(Join from computer or phone)</span>
                            </td>
                        </tr>
                    </tbody>
                </table>

                            </td>
                        </tr>

			<tr>
                            <td>
                                <hr size=3D"1" noshade=3D"noshade" style=3D=
"line-height:1px;border-color:#cccccc;">
                            </td>
                        </tr>


                        <tr>
                            <td style=3D"padding-top:10px; padding-bottom:1=
0px;">


=20=20=20=20

=20=20=20=20
=20=20=20=20=20=20=20=20
            <b>Phone Dial-in</b><br>
=20=20=20=20=20=20=20=20=20=20=20=20
                <a href=3D"tel:+1.408.740.7256">+1.408.740.7256</a> (United=
 States)<br>
=20=20=20=20=20=20=20=20=20=20=20=20
                <a href=3D"tel:+1.408.317.9253">+1.408.317.9253</a> (Altern=
ate number)<br>
            (<a href=3D"http://bluejeans.com/numbers">Global Numbers</a>)<b=
r><br>
=20=20=20=20=20=20=20=20=20=20=20=20
                Meeting ID: 923 058 766<br>
=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20
=20=20=20=20

<br><br>

=20=20=20=20
        <b>Room System</b><br>
        199.48.152.152 or bjn.vc<br><br>
        Meeting ID: 923 058 766<br>
=20=20=20=20=20=20=20=20
=20=20=20=20





			    </td>
                        </tr>


                       <tr>
                            <td>
                                <hr size=3D"1" noshade=3D"noshade" style=3D=
"line-height:1px;border-color:#cccccc;">
                            </td>
                        </tr>
                        <tr>
                            <td style=3D"padding-top:10px;padding-bottom:10=
px;">
                                <span style=3D"color:#666666">Description:<=
/span><br>
                                This&nbsp;meeting&nbsp;invite&nbsp;supersed=
es&nbsp;the&nbsp;one&nbsp;from&nbsp;Michael&nbsp;Brown,&nbsp;as&nbsp;he&nbs=
p;will&nbsp;not&nbsp;be&nbsp;able&nbsp;to<br />attend.<br /><br />Per&nbsp;=
meeting&nbsp;decision,&nbsp;this&nbsp;meeting&nbsp;invite&nbsp;is&nbsp;for&=
nbsp;the&nbsp;=E2=80=9COpenBMC&nbsp;Redfish&nbsp;working&nbsp;group=E2=80=
=9D.&nbsp;This<br />working&nbsp;group&nbsp;will&nbsp;meet&nbsp;every&nbsp;=
Monday&nbsp;at&nbsp;4pm&nbsp;CST&nbsp;and&nbsp;publish&nbsp;meeting&nbsp;mi=
nutes&nbsp;to&nbsp;the&nbsp;mailing<br />list.&nbsp;The&nbsp;working&nbsp;g=
roup&nbsp;is&nbsp;open&nbsp;to&nbsp;anybody&nbsp;who&nbsp;would&nbsp;like&n=
bsp;to&nbsp;participate&nbsp;in&nbsp;development&nbsp;of<br />Redfish&nbsp;=
on&nbsp;OpenBMC.<br />&nbsp;<br />Upcoming&nbsp;Meeting&nbsp;Agenda<br />&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018-03-05:&nbsp;Ed&nbsp;Tano=
us&nbsp;(Intel)&nbsp;to&nbsp;go&nbsp;over&nbsp;=E2=80=98bmcweb=E2=80=99&nbs=
p;requirements&nbsp;and&nbsp;implementation.<br />Depending&nbsp;on&nbsp;ti=
me,&nbsp;Michael&nbsp;Brown&nbsp;(Dell)&nbsp;to&nbsp;start&nbsp;going&nbsp;=
over&nbsp;go-redfish&nbsp;requirements&nbsp;and<br />implementation.<br />&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018-03-12:&nbsp;Michael&nbs=
p;Brown&nbsp;(Dell)&nbsp;on&nbsp;vacation.&nbsp;(May&nbsp;need&nbsp;some&nb=
sp;alternative&nbsp;host&nbsp;for<br />this&nbsp;meeting&nbsp;depending&nbs=
p;on&nbsp;if&nbsp;I&nbsp;can&nbsp;dial&nbsp;in&nbsp;from&nbsp;Iceland).<br =
/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018-03-19:&nbsp;Paul&nbs=
p;Vancil&nbsp;to&nbsp;discuss&nbsp;python&nbsp;implementation<br />&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018-03-26:&nbsp;open<br />&nbsp;<b=
r />Past&nbsp;meetings:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;Meeting&nbsp;Minutes&nbsp;2018-02-26:<br />https://lists.ozlabs.org/piper=
mail/openbmc/2018-February/010955.html<br />&nbsp;<br />
                            </td>
                        </tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

                            <tr>
                            <td>
                                <hr size=3D"1" noshade=3D"noshade" style=3D=
"line-height:1px;border-color:#cccccc;">
                            </td>
                        </tr>
                        <tr>
                            <td style=3D"padding-top:10px;padding-bottom: 1=
0px;">
                                <span style=3D"color:#666666">Want to test =
your video connection?</span><br>
                                <a href=3D"https://bluejeans.com/111?ll=3De=
n">https://bluejeans.com/111</a>
                            </td>
                        </tr>


                    </table>
                </td>
            </tr>
        </table>

<img src=3D"http://meeting.bluejeans.com/wf/open?upn=3DWRvR0uaFDj2bkiVwa2Ts=
qW4hxYG935pB-2BRn4-2FVDU-2FdmoyUWFPAsCIdkXae4Cc9FppqCl6sEXnn0Mf-2BlOhlchmbF=
2h5P5YQSWnsWV8Yo-2B9YFxvINWdjeIBoNHt9uUBQojJ0Jw11-2F0l9ltRtr5AYeHjqFrPSvmvh=
zeOVLg5flrpSP9qcsgtY1NgnMSWPeMIL1xqOwAn-2B3d4yN5oqyI93lgb-2BqsEJNyjjGHggfCy=
TEYkzc-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1=
px !important;width:1px !important;border-width:0 !important;margin-top:0 !=
important;margin-bottom:0 !important;margin-right:0 !important;margin-left:=
0 !important;padding-top:0 !important;padding-bottom:0 !important;padding-r=
ight:0 !important;padding-left:0 !important;"/>

------=_Part_103904_1086371066.1520873317825
Content-Type: text/calendar; method=REQUEST; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

BEGIN:VCALENDAR
VERSION:2.0
METHOD:REQUEST
PRODID:-//PYVOBJECT//NONSGML Version 1//EN
BEGIN:VTIMEZONE
TZID:America/Los_Angeles
TZURL:http://tzurl.org/zoneinfo-outlook/America/Los_Angeles
X-LIC-LOCATION:America/Los_Angeles
BEGIN:DAYLIGHT
TZOFFSETFROM:-0800
TZOFFSETTO:-0700
TZNAME:PDT
DTSTART:19700308T020000
RRULE:FREQ=3DYEARLY;BYMONTH=3D3;BYDAY=3D2SU
END:DAYLIGHT
BEGIN:STANDARD
TZOFFSETFROM:-0700
TZOFFSETTO:-0800
TZNAME:PST
DTSTART:19701101T020000
RRULE:FREQ=3DYEARLY;BYMONTH=3D11;BYDAY=3D1SU
END:STANDARD
END:VTIMEZONE

BEGIN:VEVENT
UID:KIrnE_wd8Gk4AltT@IFY0chntoifrfrC
DTSTART;TZID=3DAmerica/Los_Angeles:20180312T140000
DTEND;TZID=3DAmerica/Los_Angeles:20180312T150000
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP
 =3DTRUE:mailto:openbmc@lists.ozlabs.org
CREATED:20180312T164836Z
DESCRIPTION:\n\n\nTo join the meeting on a computer or mobile phone: https
 ://bluejeans.com/923058766?src=3DcalendarLink\n\nEd Tanous has invited you=
 t
 o a video meeting.\n-----------------------------------\nPhone Dial-in\n+1
 .408.740.7256 (United States)\n+1.408.317.9253 (Alternate number)\nGlobal=
=20
 Numbers: http://bluejeans.com/numbers\n\nMeeting ID: 923 058 766\n\nRoom S
 ystem\n199.48.152.152 or bjn.vc\n\nMeeting ID: 923 058 766\n--------------
 ---------------------\nDescription:\nThis meeting invite supersedes the on
 e from Michael Brown\, as he will not be able to attend.\n\nPer meeting de
 cision\, this meeting invite is for the =E2=80=9COpenBMC Redfish working g=
roup
 =E2=80=9D. This working group will meet every Monday at 4pm CST and publis=
h meet
 ing minutes to the mailing list. The working group is open to anybody who=
=20
 would like to participate in development of Redfish on OpenBMC.\n \nUpcomi
 ng Meeting Agenda\n        2018-03-05: Ed Tanous (Intel) to go over =E2=80=
=98bmc
 web=E2=80=99 requirements and implementation. Depending on time\, Michael =
Brown=20
 (Dell) to start going over go-redfish requirements and implementation.\n=
=20=20
       2018-03-12: Michael Brown (Dell) on vacation. (May need some alterna
 tive host for this meeting depending on if I can dial in from Iceland).\n=
=20
        2018-03-19: Paul Vancil to discuss python implementation\n        2
 018-03-26: open\n \nPast meetings:\n        Meeting Minutes 2018-02-26: ht
 tps://lists.ozlabs.org/pipermail/openbmc/2018-February/010955.html\n \n\n-
 ----------------------------------\nWant to test your video connection?\nh
 ttps://bluejeans.com/111\n\n
DTSTAMP:20180312T164837Z
LAST-MODIFIED:20180312T164836Z
LOCATION:BlueJeans Video Conference - https://bluejeans.com/923058766?src=
=3D
 calendarLink
ORGANIZER:mailto:ed.tanous@intel.com
RRULE:FREQ=3DWEEKLY;INTERVAL=3D1;BYDAY=3DMO;WKST=3DSU
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:OpenBMC Redfish working group working call
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

------=_Part_103904_1086371066.1520873317825--

------=_Part_103903_1324055737.1520873317825--

------=_Part_103902_842669971.1520873317825
Content-Type: application/ics; name=invite.ics
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=invite.ics

QkVHSU46VkNBTEVOREFSDQpWRVJTSU9OOjIuMA0KTUVUSE9EOlJFUVVFU1QNClBST0RJRDotLy9Q
WVZPQkpFQ1QvL05PTlNHTUwgVmVyc2lvbiAxLy9FTg0KQkVHSU46VlRJTUVaT05FDQpUWklEOkFt
ZXJpY2EvTG9zX0FuZ2VsZXMNClRaVVJMOmh0dHA6Ly90enVybC5vcmcvem9uZWluZm8tb3V0bG9v
ay9BbWVyaWNhL0xvc19BbmdlbGVzDQpYLUxJQy1MT0NBVElPTjpBbWVyaWNhL0xvc19BbmdlbGVz
DQpCRUdJTjpEQVlMSUdIVA0KVFpPRkZTRVRGUk9NOi0wODAwDQpUWk9GRlNFVFRPOi0wNzAwDQpU
Wk5BTUU6UERUDQpEVFNUQVJUOjE5NzAwMzA4VDAyMDAwMA0KUlJVTEU6RlJFUT1ZRUFSTFk7QllN
T05USD0zO0JZREFZPTJTVQ0KRU5EOkRBWUxJR0hUDQpCRUdJTjpTVEFOREFSRA0KVFpPRkZTRVRG
Uk9NOi0wNzAwDQpUWk9GRlNFVFRPOi0wODAwDQpUWk5BTUU6UFNUDQpEVFNUQVJUOjE5NzAxMTAx
VDAyMDAwMA0KUlJVTEU6RlJFUT1ZRUFSTFk7QllNT05USD0xMTtCWURBWT0xU1UNCkVORDpTVEFO
REFSRA0KRU5EOlZUSU1FWk9ORQ0KDQpCRUdJTjpWRVZFTlQNClVJRDpLSXJuRV93ZDhHazRBbHRU
QElGWTBjaG50b2lmcmZyQw0KRFRTVEFSVDtUWklEPUFtZXJpY2EvTG9zX0FuZ2VsZXM6MjAxODAz
MTJUMTQwMDAwDQpEVEVORDtUWklEPUFtZXJpY2EvTG9zX0FuZ2VsZXM6MjAxODAzMTJUMTUwMDAw
DQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RB
VD1ORUVEUy1BQ1RJT047UlNWUA0KID1UUlVFOm1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmcNCkNSRUFURUQ6MjAxODAzMTJUMTY0ODM2Wg0KREVTQ1JJUFRJT046XG5cblxuVG8gam9pbiB0
aGUgbWVldGluZyBvbiBhIGNvbXB1dGVyIG9yIG1vYmlsZSBwaG9uZTogaHR0cHMNCiA6Ly9ibHVl
amVhbnMuY29tLzkyMzA1ODc2Nj9zcmM9Y2FsZW5kYXJMaW5rXG5cbkVkIFRhbm91cyBoYXMgaW52
aXRlZCB5b3UgdA0KIG8gYSB2aWRlbyBtZWV0aW5nLlxuLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1cblBob25lIERpYWwtaW5cbisxDQogLjQwOC43NDAuNzI1NiAoVW5pdGVkIFN0
YXRlcylcbisxLjQwOC4zMTcuOTI1MyAoQWx0ZXJuYXRlIG51bWJlcilcbkdsb2JhbCANCiBOdW1i
ZXJzOiBodHRwOi8vYmx1ZWplYW5zLmNvbS9udW1iZXJzXG5cbk1lZXRpbmcgSUQ6IDkyMyAwNTgg
NzY2XG5cblJvb20gUw0KIHlzdGVtXG4xOTkuNDguMTUyLjE1MiBvciBiam4udmNcblxuTWVldGlu
ZyBJRDogOTIzIDA1OCA3NjZcbi0tLS0tLS0tLS0tLS0tDQogLS0tLS0tLS0tLS0tLS0tLS0tLS0t
XG5EZXNjcmlwdGlvbjpcblRoaXMgbWVldGluZyBpbnZpdGUgc3VwZXJzZWRlcyB0aGUgb24NCiBl
IGZyb20gTWljaGFlbCBCcm93blwsIGFzIGhlIHdpbGwgbm90IGJlIGFibGUgdG8gYXR0ZW5kLlxu
XG5QZXIgbWVldGluZyBkZQ0KIGNpc2lvblwsIHRoaXMgbWVldGluZyBpbnZpdGUgaXMgZm9yIHRo
ZSDigJxPcGVuQk1DIFJlZGZpc2ggd29ya2luZyBncm91cA0KIOKAnS4gVGhpcyB3b3JraW5nIGdy
b3VwIHdpbGwgbWVldCBldmVyeSBNb25kYXkgYXQgNHBtIENTVCBhbmQgcHVibGlzaCBtZWV0DQog
aW5nIG1pbnV0ZXMgdG8gdGhlIG1haWxpbmcgbGlzdC4gVGhlIHdvcmtpbmcgZ3JvdXAgaXMgb3Bl
biB0byBhbnlib2R5IHdobyANCiB3b3VsZCBsaWtlIHRvIHBhcnRpY2lwYXRlIGluIGRldmVsb3Bt
ZW50IG9mIFJlZGZpc2ggb24gT3BlbkJNQy5cbiBcblVwY29taQ0KIG5nIE1lZXRpbmcgQWdlbmRh
XG4gICAgICAgIDIwMTgtMDMtMDU6IEVkIFRhbm91cyAoSW50ZWwpIHRvIGdvIG92ZXIg4oCYYm1j
DQogd2Vi4oCZIHJlcXVpcmVtZW50cyBhbmQgaW1wbGVtZW50YXRpb24uIERlcGVuZGluZyBvbiB0
aW1lXCwgTWljaGFlbCBCcm93biANCiAoRGVsbCkgdG8gc3RhcnQgZ29pbmcgb3ZlciBnby1yZWRm
aXNoIHJlcXVpcmVtZW50cyBhbmQgaW1wbGVtZW50YXRpb24uXG4gIA0KICAgICAgIDIwMTgtMDMt
MTI6IE1pY2hhZWwgQnJvd24gKERlbGwpIG9uIHZhY2F0aW9uLiAoTWF5IG5lZWQgc29tZSBhbHRl
cm5hDQogdGl2ZSBob3N0IGZvciB0aGlzIG1lZXRpbmcgZGVwZW5kaW5nIG9uIGlmIEkgY2FuIGRp
YWwgaW4gZnJvbSBJY2VsYW5kKS5cbiANCiAgICAgICAgMjAxOC0wMy0xOTogUGF1bCBWYW5jaWwg
dG8gZGlzY3VzcyBweXRob24gaW1wbGVtZW50YXRpb25cbiAgICAgICAgMg0KIDAxOC0wMy0yNjog
b3BlblxuIFxuUGFzdCBtZWV0aW5nczpcbiAgICAgICAgTWVldGluZyBNaW51dGVzIDIwMTgtMDIt
MjY6IGh0DQogdHBzOi8vbGlzdHMub3psYWJzLm9yZy9waXBlcm1haWwvb3BlbmJtYy8yMDE4LUZl
YnJ1YXJ5LzAxMDk1NS5odG1sXG4gXG5cbi0NCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tXG5XYW50IHRvIHRlc3QgeW91ciB2aWRlbyBjb25uZWN0aW9uP1xuaA0KIHR0cHM6Ly9i
bHVlamVhbnMuY29tLzExMVxuXG4NCkRUU1RBTVA6MjAxODAzMTJUMTY0ODM3Wg0KTEFTVC1NT0RJ
RklFRDoyMDE4MDMxMlQxNjQ4MzZaDQpMT0NBVElPTjpCbHVlSmVhbnMgVmlkZW8gQ29uZmVyZW5j
ZSAtIGh0dHBzOi8vYmx1ZWplYW5zLmNvbS85MjMwNTg3NjY/c3JjPQ0KIGNhbGVuZGFyTGluaw0K
T1JHQU5JWkVSOm1haWx0bzplZC50YW5vdXNAaW50ZWwuY29tDQpSUlVMRTpGUkVRPVdFRUtMWTtJ
TlRFUlZBTD0xO0JZREFZPU1PO1dLU1Q9U1UNClNFUVVFTkNFOjANClNUQVRVUzpDT05GSVJNRUQN
ClNVTU1BUlk6T3BlbkJNQyBSZWRmaXNoIHdvcmtpbmcgZ3JvdXAgd29ya2luZyBjYWxsDQpUUkFO
U1A6T1BBUVVFDQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=

------=_Part_103902_842669971.1520873317825--
