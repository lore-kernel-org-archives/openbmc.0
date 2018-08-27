Return-Path: <chunhui.jia@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=chunhui.jia@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zPRz08FRzDqSL
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 17:59:39 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2018 00:59:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,294,1531810800"; d="scan'208,217";a="85221674"
Received: from shwde9518.ccr.corp.intel.com (HELO SHWDE9518) ([10.239.15.8])
 by orsmga001.jf.intel.com with ESMTP; 27 Aug 2018 00:59:34 -0700
Date: Mon, 27 Aug 2018 15:59:34 +0800
From: chunhui.jia <chunhui.jia@linux.intel.com>
To: =?UTF-8?B?VGFub3VzLCBFZA==?= <ed.tanous@intel.com>, 
 "Patrick Venture" <venture@google.com>
Cc: kuiying.wang <kuiying.wang@intel.com>, 
 =?UTF-8?B?TWlobSwgSmFtZXM=?= <james.mihm@intel.com>, 
 =?UTF-8?B?Tmd1eWVuLCBIYWkgVg==?= <hai.v.nguyen@intel.com>, 
 =?UTF-8?B?RmVpc3QsIEphbWVz?= <james.feist@intel.com>, 
 =?UTF-8?B?SmlhLCBDaHVuaHVp?= <chunhui.jia@intel.com>, 
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>, 
 =?UTF-8?B?TGksIFlvbmcgQg==?= <yong.b.li@intel.com>, 
 =?UTF-8?B?WWFuZywgQ2hlbmcgQw==?= <cheng.c.yang@intel.com>, 
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>, 
 =?UTF-8?B?WHUsIFFpYW5n?= <qiang.xu@intel.com>, 
 "kun.yi.731@gmail.com" <kun.yi.731@gmail.com>, 
 "geissonator@yahoo.com" <geissonator@yahoo.com>
Subject: Re: RE: Proposal for caching/buffering POST codes list for one boot
 process.
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>, 
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>, 
 <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>, 
 <7E9441B1E5EFFD4681F54958E8216993458355BC@ORSMSX114.amr.corp.intel.com>
X-Priority: 3
X-GUID: F5741F23-0C89-41D7-BFA9-D8FD3881344C
X-Has-Attach: no
X-Mailer: Foxmail 7.2.9.116[cn]
Mime-Version: 1.0
Message-ID: <2018082715593358738018@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart481731337687_=----"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2018 07:59:43 -0000

This is a multi-part message in MIME format.

------=_001_NextPart481731337687_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

RWQsIFZlbnR1cmUsIA0KDQpDb3VsZCB5b3UgY29uZmlybSBpZiB0aGUgIi94eXovb3BlbmJtY19w
cm9qZWN0L2hvc3QvcG9zdC8xIiB0aGF0IHdlIHRhbGtlZCBoZXJlIGNvbnRhaW5zIGEgbGlzdCBv
ZiBwb3N0IGNvZGUgZm9yIG9uZSBjeWNsZT8gDQoNCkZyb20gbXkgdW5kZXJzdGFuZGluZywgaXQg
c2hvdWxkIGJlIGxpa2U6DQoveHl6L29wZW5ibWNfcHJvamVjdC9ob3N0L3Bvc3QvY3VycmVudCAo
b2JqcGF0aCkNCi0+eHl6Lm9wZW5ibWNfcHJvamVjdC5Ib3N0LlN0YXRlLkJvb3QuUmF3IChpbnRm
KQ0KLS0tLT5WYWx1ZSAoYSBsaXN0IG9mIFBPU1QgY29kZSBmb3IgY3VycmVudCBQT1NUKSAocHJv
cGVydHkpDQoveHl6L29wZW5ibWNfcHJvamVjdC9ob3N0L3Bvc3QvMQ0KLT54eXoub3BlbmJtY19w
cm9qZWN0Lkhvc3QuU3RhdGUuQm9vdC5SYXcNCi0tLS0+VmFsdWUgKGEgbGlzdCBvZiBQT1NUIGNv
ZGUgZm9yIHByZXZpb3VzIFBPU1QpDQoveHl6L29wZW5ibWNfcHJvamVjdC9ob3N0L3Bvc3QvMg0K
LT54eXoub3BlbmJtY19wcm9qZWN0Lkhvc3QuU3RhdGUuQm9vdC5SYXcNCi0tLS0+VmFsdWUgKGEg
bGlzdCBvZiBQT1NUIGNvZGUgZm9yIHRoZSB0aW1lIGJlZm9yZSBwcmV2aW91cykNCg0KSXMgdGhh
dCBjb3JyZWN0Pw0KDQpUaGUgcmVhc29uIEkgYW0gYXNraW5nIGlzIHRoYXQgdGhlIG9yZ2luYWwg
cG9zdCBjb2RlIGludGVyZmFjZSBvbmx5IGtlZXAgKm9uZSogcG9zdCBjb2RlLiBFdmVuIGlmIG9u
ZSBEQyBjeWNsZSBjb3VsZCBnZW5lcmF0ZSAzMH40MCBwb3N0IGNvZGUsIGl0IGp1c3Qga2VlcCBs
YXRlc3QgYW5kIHByZXZpb3VzIG9uZS4gDQpJIGFzc3VtZSB0aGUgb2JqcGF0aCAveHl6L29wZW5i
bWNfcHJvamVjdC9ob3N0L3Bvc3QvMSBjb250YWlucyBhIGxpc3QuICAgT3RoZXJ3aXNlLCBpdCB3
aWxsIGp1c3QgcmVwcmVzZW50IG9uZSBwb3N0IGNvZGUgaW4gb25lIGN5Y2xlLiAgSW4gdGhlIGxh
dHRlciBjYXNlLCB3ZSB3aWxsIGhhdmUgL3h5ei9vcGVuYm1jX3Byb2plY3QvaG9zdC9wb3N0L1sw
fjQwXSBvYmplY3RzIGZvciBvbmUgY3ljbGUgYW5kIGl0IGxvb2tzIHVnbHkuIA0KDQoNCg0KY2h1
bmh1aS5qaWENCiANCkZyb206IFRhbm91cywgRWQNCkRhdGU6IDIwMTgtMDgtMjUgMDM6MzMNClRv
OiBQYXRyaWNrIFZlbnR1cmUNCkNDOiBXYW5nLCBLdWl5aW5nOyBNaWhtLCBKYW1lczsgTmd1eWVu
LCBIYWkgVjsgRmVpc3QsIEphbWVzOyBKaWEsIENodW5odWk7IE9wZW5CTUMgTWFpbGxpc3Q7IExp
LCBZb25nIEI7IFlhbmcsIENoZW5nIEM7IEJyYWQgQmlzaG9wOyBYdSwgUWlhbmc7IGt1bi55aS43
MzFAZ21haWwuY29tOyBnZWlzc29uYXRvckB5YWhvby5jb20NClN1YmplY3Q6IFJFOiBQcm9wb3Nh
bCBmb3IgY2FjaGluZy9idWZmZXJpbmcgUE9TVCBjb2RlcyBsaXN0IGZvciBvbmUgYm9vdCBwcm9j
ZXNzLg0KPiANCj4gSSBsaWtlIHRoaXMgYXBwcm9hY2gsIGJ1dCBvbmUgd291bGQgbmVlZCB0byBl
bnVtZXJhdGUgdGhlIHRyZWUgdG8ga25vdyBob3cNCj4gbWFueSB0aGVyZSBhcmUgY2FjaGVkIGF2
YWlsYWJsZS4gIEFsYmVpdCwgbWF5YmUgdGhhdCdzIHRyaXZpYWwgOkQNCiANCkEgREJ1cyBjYWxs
IHRvIE9iamVjdG1hcHBlciAgd291bGQgdGVsbCB5b3UgaG93IG1hbnkgb2JqZWN0cyB5b3UgaGF2
ZS4NCkdldFN1YnRyZWUgIHBhdGg6L3h5ei9vcGVuYm1jX3Byb2plY3QvaG9zdC9wb3N0IGRlcHRo
OiAwIGludGVyZmFjZXMgWyJ4eXoub3BlbmJtY19wcm9qZWN0Lkhvc3QuU3RhdGUuQm9vdC5SYXci
XSB3b3VsZCBnZXQgeW91IGEgbGlzdCBvZiBhbGwgUG9zdCBjb2RlIGludGVyZmFjZXMNCkRlcGVu
ZGluZyBvbiB0aGUgY29udGV4dCB5b3UgbWlnaHQgYWxzbyBiZSBhYmxlIHRvIGdldCBhd2F5IHdp
dGgganVzdCBHZXRTdWJ0cmVlUGF0aHMuDQogDQpJIHdvdWxkbid0IGNhbGwgaXQgdHJpdmlhbCwg
YnV0IGl0IGZhbGxzIGluIHRoZSBjYXRlZ29yeSBvZiBkb2FibGUuDQogDQpBbHRlcm5hdGl2ZWx5
LCBpZiB5b3Uga25vdyB5b3UgbmVlZCBhbGwgb2YgdGhlbSBmb3Igd2hhdGV2ZXIgcmVzcG9uc2Ug
eW91J3JlIGJ1aWxkaW5nLCBHZXRNYW5hZ2VkT2JqZWN0cyB0byB0aGUgUG9zdCBjb2RlIGRhZW1v
biBkaXJlY3RseSB3b3VsZCBzYXZlIHlvdSBhIHJvdW5kIHRyaXAgdGhyb3VnaCBEQnVzLg0KIA0K
IA0K

------=_001_NextPart481731337687_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 10.5pt; font-fa=
mily: 'Segoe UI'; color: rgb(0, 0, 0); line-height: 1.5; }</style></head><=
body>=0A<div><span></span><div>Ed, Venture,&nbsp;</div><div><br></div><div=
>Could you confirm if the "<span style=3D"font-family: 'Segoe UI', Tahoma;=
 line-height: normal; font-size: 10.5pt; background-color: transparent;">/=
xyz/openbmc_project/host/post/1" that we talked here contains a list of po=
st code for one cycle?&nbsp;</span></div><div><br></div><div>From my under=
standing, it should be like:</div><div><div><div style=3D"font-family: 'Se=
goe UI', Tahoma; line-height: normal;">/xyz/openbmc_project/host/post/curr=
ent (objpath)</div><div style=3D"font-family: 'Segoe UI', Tahoma; line-hei=
ght: normal;">-&gt;<span style=3D"font-size: 10.5pt; background-color: tra=
nsparent;">xyz.openbmc_project.Host.State.Boot.Raw (intf)</span></div><div=
 style=3D"font-family: 'Segoe UI', Tahoma; line-height: normal;"><span sty=
le=3D"font-size: 10.5pt; background-color: transparent;">----&gt;</span><s=
pan style=3D"color: rgb(3, 47, 98); font-family: SFMono-Regular, Consolas,=
 'Liberation Mono', Menlo, Courier, monospace; font-size: 12px; line-heigh=
t: 20px; white-space: pre; background-color: transparent;">Value (a list o=
f POST code for current POST) (property)</span></div><div style=3D"font-fa=
mily: 'Segoe UI', Tahoma; line-height: normal;">/xyz/openbmc_project/host/=
post/1</div><div style=3D"font-family: 'Segoe UI', Tahoma; line-height: no=
rmal;">-&gt;<span style=3D"font-size: 10.5pt; background-color: transparen=
t;">xyz.openbmc_project.Host.State.Boot.Raw</span></div><div style=3D"font=
-family: 'Segoe UI', Tahoma; line-height: normal;"><span style=3D"font-siz=
e: 10.5pt; background-color: transparent;">----&gt;</span><span style=3D"c=
olor: rgb(3, 47, 98); font-family: SFMono-Regular, Consolas, 'Liberation M=
ono', Menlo, Courier, monospace; font-size: 12px; line-height: 20px; white=
-space: pre; background-color: transparent;">Value </span><span style=3D"c=
olor: rgb(3, 47, 98); font-family: SFMono-Regular, Consolas, 'Liberation M=
ono', Menlo, Courier, monospace; font-size: 12px; line-height: 20px; white=
-space: pre; background-color: transparent;">(a list of POST code for prev=
ious POST)</span></div><div style=3D"font-family: 'Segoe UI', Tahoma; line=
-height: normal;">/xyz/openbmc_project/host/post/2</div></div><div style=
=3D"font-family: 'Segoe UI', Tahoma; line-height: normal;">-&gt;<span styl=
e=3D"font-size: 10.5pt; background-color: transparent;">xyz.openbmc_projec=
t.Host.State.Boot.Raw</span></div><div style=3D"font-family: 'Segoe UI', T=
ahoma; line-height: normal;"><span style=3D"font-size: 10.5pt; background-=
color: transparent;">----&gt;</span><span style=3D"color: rgb(3, 47, 98); =
font-family: SFMono-Regular, Consolas, 'Liberation Mono', Menlo, Courier, =
monospace; font-size: 12px; line-height: 20px; white-space: pre; backgroun=
d-color: transparent;">Value </span><span style=3D"color: rgb(3, 47, 98); =
font-family: SFMono-Regular, Consolas, 'Liberation Mono', Menlo, Courier, =
monospace; font-size: 12px; line-height: 20px; white-space: pre; backgroun=
d-color: transparent;">(a list of POST code for the time before previous)<=
/span></div></div><div><br></div><div>Is that correct?</div><div><br></div=
><div><span style=3D"color: rgb(3, 47, 98); font-family: SFMono-Regular, C=
onsolas, 'Liberation Mono', Menlo, Courier, monospace; line-height: 20px; =
white-space: pre; background-color: transparent;">The reason I am asking i=
s that the orginal post code interface only keep *one* post code. </span><=
span style=3D"color: rgb(3, 47, 98); font-family: SFMono-Regular, Consolas=
, 'Liberation Mono', Menlo, Courier, monospace; line-height: 20px; white-s=
pace: pre; background-color: transparent;">Even if one DC cycle could gene=
rate 30~40 post code, it just keep latest and previous one. </span><span s=
tyle=3D"color: rgb(3, 47, 98); font-family: SFMono-Regular, Consolas, 'Lib=
eration Mono', Menlo, Courier, monospace; line-height: 20px; white-space: =
pre; background-color: transparent;"> </span></div><div>I assume the objpa=
th&nbsp;<span style=3D"font-family: 'Segoe UI', Tahoma; line-height: norma=
l; font-size: 10.5pt; background-color: transparent;">/xyz/openbmc_project=
/host/post/1 contains a list. &nbsp; Otherwise, it will just represent one=
 post code in one cycle. &nbsp;In the latter case, we will have&nbsp;</spa=
n><span style=3D"font-family: 'Segoe UI', Tahoma; line-height: normal; fon=
t-size: 10.5pt; background-color: transparent;">/xyz/openbmc_project/host/=
post/[0~40] objects for one cycle and it looks&nbsp;</span><span style=3D"=
font-family: 'Segoe UI', Tahoma; font-size: 10.5pt; line-height: normal; b=
ackground-color: transparent;">ugly.&nbsp;</span></div></div>=0A<div><br><=
/div><hr style=3D"width: 210px; height: 1px;" color=3D"#b5c4df" size=3D"1"=
 align=3D"left">=0A<div><span><div style=3D"MARGIN: 10px; FONT-FAMILY: ver=
dana; FONT-SIZE: 10pt"><div>chunhui.jia</div></div></span></div>=0A<blockq=
uote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5em"><di=
v>&nbsp;</div><div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;pad=
ding:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8p=
x; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef; =
PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D"m=
ailto:ed.tanous@intel.com">Tanous, Ed</a></div><div><b>Date:</b>&nbsp;2018=
-08-25&nbsp;03:33</div><div><b>To:</b>&nbsp;<a href=3D"mailto:venture@goog=
le.com">Patrick Venture</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:ku=
iying.wang@intel.com">Wang, Kuiying</a>; <a href=3D"mailto:james.mihm@inte=
l.com">Mihm, James</a>; <a href=3D"mailto:hai.v.nguyen@intel.com">Nguyen, =
Hai V</a>; <a href=3D"mailto:james.feist@intel.com">Feist, James</a>; <a h=
ref=3D"mailto:chunhui.jia@intel.com">Jia, Chunhui</a>; <a href=3D"mailto:o=
penbmc@lists.ozlabs.org">OpenBMC Maillist</a>; <a href=3D"mailto:yong.b.li=
@intel.com">Li, Yong B</a>; <a href=3D"mailto:cheng.c.yang@intel.com">Yang=
, Cheng C</a>; <a href=3D"mailto:bradleyb@fuzziesquirrel.com">Brad Bishop<=
/a>; <a href=3D"mailto:qiang.xu@intel.com">Xu, Qiang</a>; <a href=3D"mailt=
o:kun.yi.731@gmail.com">kun.yi.731@gmail.com</a>; <a href=3D"mailto:geisso=
nator@yahoo.com">geissonator@yahoo.com</a></div><div><b>Subject:</b>&nbsp;=
RE: Proposal for caching/buffering POST codes list for one boot process.</=
div></div></div><div><div>&gt; </div>=0A<div>&gt; I like this approach, bu=
t one would need to enumerate the tree to know how</div>=0A<div>&gt; many =
there are cached available.&nbsp; Albeit, maybe that's trivial :D</div>=0A=
<div>&nbsp;</div>=0A<div>A DBus call to Objectmapper&nbsp; would tell you =
how many objects you have.</div>=0A<div>GetSubtree&nbsp; path:/xyz/openbmc=
_project/host/post depth: 0 interfaces ["xyz.openbmc_project.Host.State.Bo=
ot.Raw"] would get you a list of all Post code interfaces</div>=0A<div>Dep=
ending on the context you might also be able to get away with just GetSubt=
reePaths.</div>=0A<div>&nbsp;</div>=0A<div>I wouldn't call it trivial, but=
 it falls in the category of doable.</div>=0A<div>&nbsp;</div>=0A<div>Alte=
rnatively, if you know you need all of them for whatever response you're b=
uilding, GetManagedObjects to the Post code daemon directly would save you=
 a round trip through DBus.</div>=0A<div>&nbsp;</div>=0A<div>&nbsp;</div>=
=0A</div></blockquote>=0A</body></html>
------=_001_NextPart481731337687_=------
