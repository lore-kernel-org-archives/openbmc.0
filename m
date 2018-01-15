Return-Path: <Balaji.B.Rao@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=balaji.b.rao@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="ljyjt9Fl"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zKzzW0W7BzF0W0
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 03:57:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1516035431; x=1547571431;
 h=from:to:subject:date:message-id:mime-version;
 bh=OMZUUX0vf8xh6gri1VkeFpahMbNznfPrmOpdB7a5Bds=;
 b=ljyjt9FlHGjIcksTIwZqu8zjNn9kTWCCQ3tMSY4tNPuaw9/6jzOw7vYl
 ouTaNUz9bn+eQpz1AkSjJSe3NfUCrX2Uu2/ivGm/l+HIAg3XYkHDxIvCS
 Aqf+PersZ59Z7f491hsTFFJX00NISIL9Gc5xY9bLiEgZnekcOx5RsV41J 8=;
IronPort-PHdr: =?us-ascii?q?9a23=3A9eLQSBexIXnGA/IyrdO91l2BlGMj4u6mDksu8pMi?=
 =?us-ascii?q?zoh2WeGdxcu8Yh7h7PlgxGXEQZ/co6odzbaO6ua4ASQp2tWoiDg6aptCVhsI24?=
 =?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
 =?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9HiTahfL9+Ngm6oRnMvcQKnIVuLbo8xAHUqXVSYe?=
 =?us-ascii?q?RWwm1oJVOXnxni48q74YBu/SdNtf8/7sBMSar1cbg2QrxeFzQmLns65Nb3uhnZ?=
 =?us-ascii?q?TAuA/WUTX2MLmRdVGQfF7RX6XpDssivms+d2xSeXMdHqQb0yRD+v6bpgRh31hy?=
 =?us-ascii?q?cdLzM38H/ZhNFsjKxVoxyhpgBwzIHPbY6PKPZ+fLnQcc8GSWZfWMtaSixPApm7?=
 =?us-ascii?q?b4sKF+cMOvtVoJP5p1QUrxu+BBOgCf71xjFUnHD22rY33Pk/HgHC2AwsBc4BsH?=
 =?us-ascii?q?PRrNjsMqoZTOO7zLHQwDjCbP5awynx5YbWfhw7vP2BXb19fdDQxEQhDw/Jk0mc?=
 =?us-ascii?q?pZb4Mz6a2OkBqXaX4uV+We61iWMqqxl9riWgy8oikIXFm4MYx1He+Sh6wIs5P8?=
 =?us-ascii?q?O0RFJnbdOiDZBerTuVN5FsTcMnW2xovSE6xaAYtpOjZygKzYgnxwbYa/yab4iE?=
 =?us-ascii?q?+hLjW/iVITd/nH9qZqm/iAy8/ES61+LzSM200FJToipCj9nMqmsC1xvO6siBV/?=
 =?us-ascii?q?Rx4F2t2TeX1wDT7+FFLlo4mrbcK54k2rIwl5wTvlrfHiLumUj7j7Waelsq9+S2?=
 =?us-ascii?q?8ejrf7Xrq5CGO4J1hAzyKqEulda+AeQ8PAgORW+b+eGk2bD+50L5RK9Fjv83kq?=
 =?us-ascii?q?XDrZ3WP9gVqbS+AwJOz4ks9RK/DzO83NsEmnkHKUpJeAibgIjxJ1HOPPf4AO+4?=
 =?us-ascii?q?g1S0jjhrwevJPrj9DZjWKnjDkazhfapm60JGzwoyzNRf6IhPBbEaOv7zXVXxtN?=
 =?us-ascii?q?OLRiM+Zliz2+vhAtB2/ocfQn6URKiLNKrYqhmP/O15cMeWY4pA7Bz0L/En5rjE?=
 =?us-ascii?q?y0UwnncRcK2tm5AQbSbrTbxdP0yFbC+00Z86GmAQs19mQQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GfAgBd3Fxahz+a6ERdHAEBAQQBAQoBA?=
 =?us-ascii?q?YJKgU0QdC6dD4QCjUKKAAqKDkMUAQEBAQEBAQEBAQIQAQEBCgsJCCgvgjgigng?=
 =?us-ascii?q?GXgE4bgEEG4lHZKwxOol8hlGMXoUuBYpNiU2PSgqBdZNDgiKGHYQVh0WXJYE8N?=
 =?us-ascii?q?oFzb4J9ggMMRBAMgWeLXoEPgRcBAQE?=
X-IPAS-Result: =?us-ascii?q?A2GfAgBd3Fxahz+a6ERdHAEBAQQBAQoBAYJKgU0QdC6dD4Q?=
 =?us-ascii?q?CjUKKAAqKDkMUAQEBAQEBAQEBAQIQAQEBCgsJCCgvgjgigngGXgE4bgEEG4lHZ?=
 =?us-ascii?q?KwxOol8hlGMXoUuBYpNiU2PSgqBdZNDgiKGHYQVh0WXJYE8NoFzb4J9ggMMRBA?=
 =?us-ascii?q?MgWeLXoEPgRcBAQE?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2018 10:57:06 -0600
From: <Balaji.B.Rao@dell.com>
Received: from ausxippc110.us.dell.com ([143.166.85.200])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2018 22:48:40 +0600
X-LoopCount0: from 10.166.132.49
X-IronPort-AV: E=Sophos;i="5.46,364,1511848800"; 
 d="scan'208,217";a="602907037"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: Issue with flash space overflow? Maybe?
Thread-Topic: Issue with flash space overflow? Maybe?
Thread-Index: AdOOIcqPo13oWnLsTT+kI7Q9rwqDBQ==
Date: Mon, 15 Jan 2018 16:57:05 +0000
Message-ID: <703062ea845f4553be9065a2d5b6eb61@ausx13mpc109.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiJhZTFmOTM2ZC1lNWJlLTQyYWMtOGE4MC03MWQyZTY3MWY3NzkiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6Imp2aHVlYm1MM3BoMXZjdjQ0WGxpcVRvXC85bVhmb0EwQVlTWnRRenI0dDU4PSJ9
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_703062ea845f4553be9065a2d5b6eb61ausx13mpc109AMERDELLCOM_"
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Jan 2018 06:16:44 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jan 2018 16:57:12 -0000

--_000_703062ea845f4553be9065a2d5b6eb61ausx13mpc109AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Palmetto, when I flash a build, I get this error. Netboot from the same =
image works, however when I flash by copying the static.mtd image, I see th=
is issue. I'm trying to add a bunch of python packages to the build. Could =
it be a flash space issue? Please advise if anybody has any thoughts on thi=
s and how this can be overcome?

Thanks
Balaji

rofs =3D mtd4 squashfs rwfs =3D mtd5 jffs2
mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argument
[    8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00000000: 0xc881 instead
[    8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00000004: 0x3296 instead
[    8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00000008: 0x390f instead
[    8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x0000000c: 0x6a89 instead
[    8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00000010: 0xf6c6 instead
[    8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00000014: 0xd735 instead
[    8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00000018: 0xf917 instead
[    8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x0000001c: 0x868d instead
[    8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00000020: 0x5106 instead
[    8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00000024: 0xde44 instead
[    8.190000] jffs2: Further such events for this erase block will not be =
printed
[    8.190000] jffs2: Old JFFS2 bitmask found at 0x0000d0a0
[    8.190000] jffs2: You cannot use older JFFS2 filesystems with newer ker=
nels
[    8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00010000: 0x8566 instead
[    8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00010004: 0xc4fe instead
[    8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00010008: 0xc94e instead
[    8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x0001000c: 0x92f0 instead
[    8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00010010: 0xb131 instead
[    8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00010014: 0x48d8 instead
[    8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00010018: 0xbf08 instead
[    8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x0001001c: 0x0d4f instead
[    8.330000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00010020: 0x2f17 instead
[    8.330000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00010024: 0x055a instead
[    8.330000] jffs2: Further such events for this erase block will not be =
printed
[    8.330000] jffs2: Old JFFS2 bitmask found at 0x000180bc
[    8.330000] jffs2: You cannot use older JFFS2 filesystems with newer ker=
nels
[    8.330000] jffs2: Cowardly refusing to erase blocks on filesystem with =
no valid JFFS2 nodes
[    8.330000] jffs2: empty_blocks 62, bad_blocks 0, c->nr_blocks 64
mount: mounting /dev/mtdblock5 on run/initramfs/rw failed: Input/output err=
or

Mounting read-write /dev/mtdblock5 filesystem failed.  Please fix and run
mount /dev/mtdblock5 run/initramfs/rw -t jffs2 -o rw
to to continue, or do change nothing to run from RAM for this boot.
Enter password to try to manually fix.
After fixing run exit to continue this script, or reboot -f to retry, or
touch /takeover and exit to become PID 1 allowing editing of this script.
Give root password for system maintenance
(or type Control-D for normal startup):

--_000_703062ea845f4553be9065a2d5b6eb61ausx13mpc109AMERDELLCOM_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">On Palmetto, when I flash a build, I get this error.=
 Netboot from the same image works, however when I flash by copying the sta=
tic.mtd image, I see this issue. I&#8217;m trying to add a bunch of python =
packages to the build. Could it be a flash
 space issue? Please advise if anybody has any thoughts on this and how thi=
s can be overcome?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Balaji<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
rofs =3D mtd4 squashfs rwfs =3D mtd5 jffs2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argument=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00000000: 0xc881 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00000004: 0x3296 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00000008: 0x390f instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x0000000c: 0x6a89 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp; &nbsp;8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00000010: 0xf6c6 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00000014: 0xd735 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00000018: 0xf917 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x0000001c: 0x868d instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00000020: 0x5106 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00000024: 0xde44 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: Further such events for this erase blo=
ck will not be printed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: Old JFFS2 bitmask found at 0x0000d0a0<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: You cannot use older JFFS2 filesystems=
 with newer kernels<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00010000: 0x8566 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00010004: 0xc4fe instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00010008: 0xc94e instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x0001000c: 0x92f0 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00010010: 0xb131 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00010014: 0x48d8 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00010018: 0xbf08 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.190000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x0001001c: 0x0d4f instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.330000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00010020: 0x2f17 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.330000] jffs2: jffs2_scan_eraseblock(): Magic bitmask=
 0x1985 not found at 0x00010024: 0x055a instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.330000] jffs2: Further such events for this erase blo=
ck will not be printed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.330000] jffs2: Old JFFS2 bitmask found at 0x000180bc<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.330000] jffs2: You cannot use older JFFS2 filesystems=
 with newer kernels<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.330000] jffs2: Cowardly refusing to erase blocks on f=
ilesystem with no valid JFFS2 nodes<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
[&nbsp;&nbsp;&nbsp; 8.330000] jffs2: empty_blocks 62, bad_blocks 0, c-&gt;n=
r_blocks 64<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
mount: mounting /dev/mtdblock5 on run/initramfs/rw failed: Input/output err=
or<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Mounting read-write /dev/mtdblock5 filesystem failed.&nbsp; Please fix and =
run<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
mount /dev/mtdblock5 run/initramfs/rw -t jffs2 -o rw<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
to to continue, or do change nothing to run from RAM for this boot.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Enter password to try to manually fix.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
After fixing run exit to continue this script, or reboot -f to retry, or<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
touch /takeover and exit to become PID 1 allowing editing of this script.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Give root password for system maintenance<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
(or type Control-D for normal startup):<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_703062ea845f4553be9065a2d5b6eb61ausx13mpc109AMERDELLCOM_--
