Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp06.in.ibm.com (e28smtp06.in.ibm.com [125.16.236.6])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qr9D84s3fzDqcc
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 17:21:44 +1000 (AEST)
Received: from localhost
 by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 21 Apr 2016 12:51:29 +0530
Received: from d28relay04.in.ibm.com (9.184.220.61)
 by e28smtp06.in.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 21 Apr 2016 12:51:14 +0530
X-IBM-Helo: d28relay04.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp03.ny.us.ibm.com ([146.89.104.211])
 by d28relay04.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3L7LA4E47907002
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 12:51:11 +0530
Message-Id: <201604210721.u3L7LA4E47907002@d28relay04.in.ibm.com>
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 21 Apr 2016 03:19:46 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 21 Apr 2016 03:19:45 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 21 Apr 2016 07:19:44 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 21 Apr 2016 07:19:42 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016042107194177-56228 ;
 Thu, 21 Apr 2016 07:19:41 +0000 
MIME-Version: 1.0
In-Reply-To: <201604202051.u3KKpncl012123@d03av03.boulder.ibm.com>
Subject: Re: FRU VPD - MAC and UUID
To: "Adriana Kobylak" <anoo@us.ibm.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, OpenBMC_Members@d28relay04.in.ibm.com
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Thu, 21 Apr 2016 12:49:39 +0530
References: <201604202051.u3KKpncl012123@d03av03.boulder.ibm.com>
X-KeepSent: 8D1BA077:1EE8B83E-65257F9C:0026C2C6;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 10875
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF50FDFB544568f9e8a93df938690918cEABBF50FDFB54456"
x-cbid: 16042107-0021-0000-0000-00000BBD1FC8
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.28249; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005183; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000160; SDB=6.00691139; UDB=6.00318568; UTC=2016-04-21
 07:19:42
x-cbparentid: 16042107-4536-0000-0000-0000074ED68F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Apr 2016 07:21:45 -0000

--0__=EABBF50FDFB544568f9e8a93df938690918cEABBF50FDFB54456
Content-type: multipart/alternative; 
	Boundary="1__=EABBF50FDFB544568f9e8a93df938690918cEABBF50FDFB54456"


--1__=EABBF50FDFB544568f9e8a93df938690918cEABBF50FDFB54456
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Answering #2:

IPMI FRU format has 2 more sections namely, INTERNAL and MULTI although we
have not been using this in our code.



I would vote for appending the MAC as part of product or board and then
updating the offsets+size accordingly in the area specific header that
would now tell the size including the MAC data. What this also means is
that common header meta data would change.

Another approach would be looking at what areas have *not* been populated
for some FRU that is on the board and then squeeze this new one into that
un-populated area and populate that area specific header and common header.

All the FRU's may not necessarily have all the areas populated. What I have
seen most is just 2 areas ( Board, Product) / ( Chassis, Board) / (Chassis,
Product) so we can use whatever that is not populated and put this new one
there.

Also, if this VPD is readable by HB, I am guessing we would need to tell HB
on this format.

We do not want to append MAC to product area since it overlaps with multi
area and will result in corruption..

Last resort,  we can either use INTERNAL -or- MULTI but using INTERNAL area
looks a more cleaner -but- that needs a code change since we have not been
supporting it. So I would nto vote for this....

Thanks

---------------------------------------------------------------------------=
----------

Thanks and Regards,
Vishwanath.
Advisory Software Engineer,
Power Firmware Development,
Systems &Technology Lab,
MG2-6F-255 , Manyata Embassy Business Park,
Bangalore , KA , 560045
Ph: +91-80-46678255
E-mail: vishwanath@in.ibm.com
---------------------------------------------------------------------------=
-------



From:	"Adriana Kobylak" <anoo@us.ibm.com>
To:	OpenBMC <openbmc@lists.ozlabs.org>
Date:	21/04/2016 02:22 am
Subject:	FRU VPD - MAC and UUID
Sent by:	"openbmc" <openbmc-bounces
            +vishwanath=3Din.ibm.com@lists.ozlabs.org>



Mfg will be storing the MAC address and UUID of the Barreleye system in the
FRU VPD so that we can persist it better. Couple questions:

1. The UUID is planned to be stored in the motherboard VPD. Anybody has the
info on which eeprom is the motherboard VPD? Seems the only chips
under /sys/bus/i2c/devices/ with vpd are the ones from the i/o, expander,
and hdd cards (0-0050, 6-0055, 6-0051).

2. The MAC is planned to be stored at the end of the i/o board VPD. All of
the FRU VPD follow the format of header->chassis=5Finfo->board=5Finfo->
product=5Finfo. The header contains the offset to the *=5Finfo areas. Witho=
ut
an offset to the MAC (which would be stored after the product=5Finfo area),
we could just read passed the product=5Farea and if it's not 0s, assume it's
the MAC. Would it be better to ask Mfg to add the offset to the MAC to
header although this breaks the IPMI formatting, or get the MAC into one of
the custom fields inside the product info area. Thoughts?
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc



--1__=EABBF50FDFB544568f9e8a93df938690918cEABBF50FDFB54456
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Answering #2:<br><br>IPMI FRU format has 2 more sections nam=
ely, INTERNAL and MULTI although we have not been using this in our code.<b=
r><br><img src=3D"cid:1=5F=5F=3DEABBF50FDFB544568f9e8a93df938690918cEAB@" w=
idth=3D"242" height=3D"328"><br><br>I would vote for appending the MAC as p=
art of product or board and then updating the offsets+size accordingly in t=
he area specific header that would now tell the size including the MAC data=
. What this also means is that common header meta data would change.<br><br=
>Another approach would be looking at what areas have *not* been populated =
for some FRU that is on the board and then squeeze this new one into that u=
n-populated area and populate that area specific header and common header.<=
br><br>All the FRU's may not necessarily have all the areas populated. What=
 I have seen most is just 2 areas ( Board, Product) / ( Chassis, Board) / (=
Chassis, Product) so we can use whatever that is not populated and put this=
 new one there.<br><br>Also, if this VPD is readable by HB, I am guessing w=
e would need to tell HB on this format.<br><br>We do not want to append MAC=
 to product area since it overlaps with multi area and will result in corru=
ption..<br><br>Last resort,  we can either use INTERNAL -or- MULTI but usin=
g INTERNAL area looks a more cleaner -but- that needs a code change since w=
e have not been supporting it. So I would nto vote for this....<br><br>Than=
ks<br><br>-----------------------------------------------------------------=
--------------------<br>Thanks and Regards,<br>Vishwanath.<br>Advisory Soft=
ware Engineer,<br>Power Firmware Development, <br>Systems &amp;Technology L=
ab,<br>MG2-6F-255 , Manyata Embassy Business Park, <br>Bangalore , KA , 560=
045<br>Ph: +91-80-46678255<br>E-mail: vishwanath@in.ibm.com<br>------------=
----------------------------------------------------------------------<br><=
br><img width=3D"16" height=3D"16" src=3D"cid:2=5F=5F=3DEABBF50FDFB544568f9=
e8a93df938690918cEAB@" border=3D"0" alt=3D"Inactive hide details for &quot;=
Adriana Kobylak&quot; ---21/04/2016 02:22:18 am---Mfg will be storing the M=
AC address and UUID of the Bar"><font color=3D"#424282">&quot;Adriana Kobyl=
ak&quot; ---21/04/2016 02:22:18 am---Mfg will be storing the MAC address an=
d UUID of the Barreleye system in  the FRU VPD so that we can</font><br><br=
><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">&q=
uot;Adriana Kobylak&quot; &lt;anoo@us.ibm.com&gt;</font><br><font size=3D"2=
" color=3D"#5F5F5F">To:        </font><font size=3D"2">OpenBMC &lt;openbmc@=
lists.ozlabs.org&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Date:    =
    </font><font size=3D"2">21/04/2016 02:22 am</font><br><font size=3D"2" =
color=3D"#5F5F5F">Subject:        </font><font size=3D"2">FRU VPD - MAC and=
 UUID</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><=
font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.ibm=
.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"=
left" noshade style=3D"color:#8091A5; "><br><br><br>Mfg will be storing the=
 MAC address and UUID of the Barreleye system in the FRU VPD so that we can=
 persist it better. Couple questions:<font size=3D"4"><br></font><br>1. The=
 UUID is planned to be stored in the motherboard VPD. Anybody has the info =
on which eeprom is the motherboard VPD? Seems the only chips under /sys/bus=
/i2c/devices/ with vpd are the ones from the i/o, expander, and hdd cards (=
0-0050, 6-0055, 6-0051).<font size=3D"4"><br></font><br>2. The MAC is plann=
ed to be stored at the end of the i/o board VPD. All of the FRU VPD follow =
the format of header-&gt;chassis=5Finfo-&gt;board=5Finfo-&gt;product=5Finfo=
. The header contains the offset to the *=5Finfo areas. Without an offset t=
o the MAC (which would be stored after the product=5Finfo area), we could j=
ust read passed the product=5Farea and if it's not 0s, assume it's the MAC.=
 Would it be better to ask Mfg to add the offset to the MAC to header altho=
ugh this breaks the IPMI formatting, or get the MAC into one of the custom =
fields inside the product info area. Thoughts?<tt>=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openb=
mc@lists.ozlabs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinf=
o/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><=
br><br><BR>
</body></html>

--1__=EABBF50FDFB544568f9e8a93df938690918cEABBF50FDFB54456--


--0__=EABBF50FDFB544568f9e8a93df938690918cEABBF50FDFB54456
Content-type: image/jpeg; 
	name="0C765961.jpg"
Content-Disposition: inline; filename="0C765961.jpg"
Content-ID: <1__=EABBF50FDFB544568f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAgEASABIAAD/2wCEAAICAgICAQICAgICAgICAwQDAwMDAwUEBAMEBgYHBgYG
BgYHCAoIBwcJBwYGCAsJCQoKCwsLBwgMDQwKDAoLCwoBAgICAwMDBQMDBQoHBgcKCgoKCgoKCgoK
CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIAUgA8gMBIQACEQED
EQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsBAAMBAQEBAQEBAQEAAAAAAAABAgME
BQYHCAkKCxAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAk
M2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqD
hIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl
5ufo6erx8vP09fb3+Pn6EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGh
scEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlq
c3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV
1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP18/wCGT/2WB/zbT8AP/DeaH/8A
I1J/wyh+yx/0bT8AP/DeaH/8jUAH/DKH7LH/AEbT8AP/AA3mh/8AyNR/wyh+yx/0bT8AP/DeaH/8
jUAH/DKH7LH/AEbT8AP/AA3mh/8AyNR/wyh+yx/0bT8AP/DeaH/8jUAH/DKH7LH/AEbT8AP/AA3m
h/8AyNR/wyh+yx/0bT8AP/DeaH/8jUAH/DKH7LH/AEbT8AP/AA3mh/8AyNR/wyh+yx/0bT8AP/De
aH/8jUAH/DKH7LH/AEbT8AP/AA3mh/8AyNR/wyh+yx/0bT8AP/DeaH/8jUAH/DKH7LH/AEbT8AP/
AA3mh/8AyNR/wyh+yx/0bT8AP/DeaH/8jUAH/DKH7LH/AEbT8AP/AA3mh/8AyNR/wyh+yx/0bT8A
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
Q/8A5Jo/4ax/ZY/6OW/Z/wD/AA4eh/8AyTSA/9k=


--0__=EABBF50FDFB544568f9e8a93df938690918cEABBF50FDFB54456
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <2__=EABBF50FDFB544568f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF50FDFB544568f9e8a93df938690918cEABBF50FDFB54456--
