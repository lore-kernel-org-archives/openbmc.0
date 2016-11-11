Return-Path: <Tiju.Jacob@flextronics.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
 [216.82.251.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFlF515ktzDvpk
 for <openbmc@lists.ozlabs.org>; Sat, 12 Nov 2016 03:07:52 +1100 (AEDT)
Received: from [216.82.251.43] by server-16.bemta-12.messagelabs.com id
 8D/1F-24059-6DCE5285; Fri, 11 Nov 2016 16:07:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSa0hTYRjed87ZdhRXn5ttb0MJV0pWs7QokwK
 JQAkCRX9I2OUsT9toF9lZNelH62a4qPyxUhemaYbUNCvDWiVoV2W1LtrV6GYxL92VgqLa2Zlm
 /57ved7ne9735aVJuVeiplmHnbVZGJNGEk0tSsxaq300klS4oHaQzPA9pDMan/ZKMnr2BKmMs
 T9uIovK6dvnk+Y8b98lzQlUHUc57sZWKpdaIzZadFbHBrHhkP8yKvmodHz71Us40W2lC0XTcu
 wmwPmwmRAeNxGU+/3IhaJoCdaCd89nsQvRdBzeCs5BlqdJvBTOf3kg5WkFjoe7TzFPx+EEaO7
 qJQWcCT86msQ8pnASjNa3hrEMF8HLULYQtROB70mHlBei8AJwfQ1KeIywEr73eAkhSwXPBmrD
 GDCGE1cCpICnweDb32Khvgi85WWUwGvg04E7JB8AuI6E65UXIobV0PrhFjGOHzfsFwt4M/y81
 x4xbwd3e0fE3ImgPdAcKYqHCld3ROgXw41DZ8MOOdZD29Wv4REUWA0vesuRgOMh2H81vDkSp8
 AZ33xhmkRw738tFVYRC93VA1QFSvZMGtTzz+GZ5PBMctQh6hSazbG2raxNm74wVWcz6g12M2M
 0adPS0lPNLMcxetbE6LjUjVbzORS6nB0iEbqITleu6kLTaUIzTZbyLqlQPkVnLS41MJxhvW2L
 ieW6UDxNa0B2bDikxdpYPevYZDSFzm9cBjpGEyfL5GUZV8KYOaNekHqQln7SF3xFyCmL1cKqV
 bIRvgjzRYYtlokvxo/4AUpQK2RIJBLJY0pYm9lo/18fQioaaRSyW/wvMUaLfSJpKNQEEWqiat
 0svgk7809SO9F9VfKruo7kS5651d/fL+xPG56nu7Yk4MrsfBOV1/XRUZ+tmPF7+PBY4rL8d59
 q/AkH2IJ9bZdq7lbvLQts67NGNxe3bC7bnVtrLJiz4lt3sXOFbqZyqv95yv0R7/Ls+SetiXsP
 jjY1LPaZF48m5zcqW3YdTSg9IjJvWK+3BvNWHum8pqE4A5M2h7RxzF+m3f10vwMAAA==
X-Env-Sender: Tiju.Jacob@flextronics.com
X-Msg-Ref: server-7.tower-196.messagelabs.com!1478880469!57070636!1
X-Originating-IP: [52.33.64.93]
X-StarScan-Received: 
X-StarScan-Version: 9.0.16; banners=flextronics.com,-,-
X-VirusChecked: Checked
Received: (qmail 38780 invoked from network); 11 Nov 2016 16:07:49 -0000
Received: from ec2-52-33-64-93.us-west-2.compute.amazonaws.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) (52.33.64.93)
 by server-7.tower-196.messagelabs.com with AES256-SHA256 encrypted SMTP;
 11 Nov 2016 16:07:49 -0000
Received: from MWHPR08MB2431.namprd08.prod.outlook.com (10.169.203.135) by
 MWHPR08MB2432.namprd08.prod.outlook.com (10.169.203.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.707.6; Fri, 11 Nov 2016 16:07:48 +0000
Received: from MWHPR08MB2431.namprd08.prod.outlook.com ([10.169.203.135]) by
 MWHPR08MB2431.namprd08.prod.outlook.com ([10.169.203.135]) with mapi id
 15.01.0707.006; Fri, 11 Nov 2016 16:07:48 +0000
From: Tiju Jacob <Tiju.Jacob@flextronics.com>
To: Andrew Jeffery <andrew@aj.id.au>, Patrick Williams <patrick@stwcx.xyz>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Add new machine
Thread-Topic: Add new machine
Thread-Index: AdI7lmMPO5LOJ365SZiOHBgMnIAi5gADGmCAACSeiDA=
Date: Fri, 11 Nov 2016 16:07:47 +0000
Message-ID: <MWHPR08MB2431FE7A69A2F10D4874DEDD95BB0@MWHPR08MB2431.namprd08.prod.outlook.com>
References: <MWHPR08MB2431CF1685C470069330770495B80@MWHPR08MB2431.namprd08.prod.outlook.com>
 <1478817355.12438.3.camel@aj.id.au>
In-Reply-To: <1478817355.12438.3.camel@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.116.144.29]
x-microsoft-exchange-diagnostics: 1; MWHPR08MB2432;
 7:FaGRsuw7MORCdsf2pnXzP3pVU05ztryQXZQiScAnGx0JnitQ9MAYVNihp1p6JFB0rqGoOodJYzG/x4LYxQ1YfFq/NvuPxSRVWKA3VMY6GE+4ZSdErasbsr2xMXBrf0C3WVEjBz6TVHgJlwa7lpTUHaWxktCX0KIXrzy057s+YdMK4cLGpHAJWgyVeBcFrnSn6OOw0zxqHa1b5QvVvj6gSgBcb/Vt/Jc0U8mvePdqcgw+9CSmLUTAjnmgcp55SiEd8DP1vLAn9X3nxTVNTW0NdmPxCrhEkx4eHh81VD6859ju5Nj4x2IsxniIiWJxg4wc+7E4Xaq18Q2u8LsHTjCAF5r627/bRxni8KOdioiN0SI=
x-ms-office365-filtering-correlation-id: 701f22d6-1777-4aa5-7988-08d40a4ce175
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:MWHPR08MB2432;
x-microsoft-antispam-prvs: <MWHPR08MB24320A5FFD26B13D407BFADC95BB0@MWHPR08MB2432.namprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(65623756079841)(81227570615382)(254811256790911)(5213294742642);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040176)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
 SRVR:MWHPR08MB2432; BCL:0; PCL:0; RULEID:; SRVR:MWHPR08MB2432; 
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(6009001)(7916002)(377424004)(377454003)(199003)(189002)(13464003)(24454002)(33656002)(3660700001)(122556002)(305945005)(7846002)(7736002)(74316002)(7696004)(229853002)(3846002)(87936001)(4326007)(6116002)(102836003)(2906002)(8676002)(86362001)(81156014)(81166006)(586003)(4001150100001)(7116003)(5001770100001)(3480700004)(76576001)(101416001)(8936002)(97736004)(99286002)(189998001)(106356001)(3280700002)(5660300001)(105586002)(50986999)(2950100002)(9686002)(77096005)(92566002)(2900100001)(54356999)(76176999)(68736007)(66066001)(36250200004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR08MB2432;
 H:MWHPR08MB2431.namprd08.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: flextronics.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: flextronics.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2016 16:07:47.9915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB2432
X-CFilter-Loop: Reflected
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2016 16:07:53 -0000

VGhhbmtzIEFuZHJldyBmb3IgdGhlIGluZm8uIAoKSGkgUGF0cmljay9CcmFkLAoKQXJlIHRoZXJl
IHBsYW5zIHRvIHB1bGwgZmFjZWJvb2sncyBPcGVuQk1DIHRvIHRoaXMgcmVwby4gCkNhbiB5b3Ug
dGhyb3cgc29tZSBsaWdodCBvbiB0aGlzLiBJJ20gbm90IHN1cmUgaG93IHRvIHByb2NlZWQuCgpU
aGFua3MgYW5kIFJlZ2FyZHMsClRpanUKCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206
IEFuZHJldyBKZWZmZXJ5IFttYWlsdG86YW5kcmV3QGFqLmlkLmF1XSAKU2VudDogVGh1cnNkYXks
IE5vdmVtYmVyIDEwLCAyMDE2IDU6MzYgUE0KVG86IFRpanUgSmFjb2IgPFRpanUuSmFjb2JAZmxl
eHRyb25pY3MuY29tPjsgUGF0cmljayBXaWxsaWFtcyA8cGF0cmlja0BzdHdjeC54eXo+OyBCcmFk
IEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPgpDYzogb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnClN1YmplY3Q6IFJlOiBBZGQgbmV3IG1hY2hpbmUKCkhpIFRpanUsCgpPbiBUaHUs
IDIwMTYtMTEtMTAgYXQgMjE6MDggKzAwMDAsIFRpanUgSmFjb2Igd3JvdGU6Cj4gSGksCj4gwqAK
PiBXZSBoYXZlIGEgbmV3IG1hY2hpbmUgbWFkZSBhbmQgbW9zdCBvZiB0aGUgY29kZSBpcyBsZXZl
cmFnZWQgZnJvbSAKPiBXZWRnZTEwMC4KCj4gIEkgd291bGQgbGlrZSB0byBzdWJtaXQgY29kZSBi
YWNrIHRvIE9wZW5ibWMgZ2l0IGh1Yi4KCkdyZWF0IQoKV2UgaGF2ZSBiZWVuIHdvcmtpbmcgd2l0
aCBGYWNlYm9vayB0byB0cnkgY29uc29saWRhdGUgZWZmb3J0cywgYXMgdGhpcyBPcGVuQk1DIHBy
b2plY3QgKGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvKSBpcyBub3QgcXVpdGUg
dGhlIHNhbWUqIGFzIEZhY2Vib29rJ3MgT3BlbkJNQyAoaHR0cHM6Ly9naXRodWIuY29tL2ZhY2Vi
b29rL29wZW5ibWMvKQp3aGVyZSBXZWRnZTEwMCBjYW4gYmUgZm91bmQuIAoKUmVnYXJkaW5nIHN1
Ym1pdHRpbmcgY29kZSwgT3BlbkJNQydzIHByZXNlbmNlIG9uIGdpdGh1YiBpcyBwcmltYXJpbHkg
Zm9yIGRpc3RyaWJ1dGlvbiBhbmQgaXNzdWUgdHJhY2tpbmcuIFdlJ3JlIHVzaW5nIEdlcnJpdCB0
byBtYW5hZ2UgcGF0Y2hlcyBmb3IgT3BlbkJNQy1vd25lZCBwcm9qZWN0czoKCmh0dHBzOi8vZ2Vy
cml0Lm9wZW5ibWMtcHJvamVjdC54eXovIy9xL3N0YXR1czpvcGVuCgoKPiBJIHdvdWxkIGxpa2Ug
dG8gY3JlYXRlIGEgbmV3IG1hY2hpbmUgbGlrZSDigJhtZXRhLXdlZGdlMTAw4oCZIHdpdGggbW9z
dCBvZiAKPiB0aGUgcmVmZXJlbmNlcyBiYWNrIHRvIHdlZGdlMTAwIGFuZCBrZWVwIG9ubHkgdGhl
IGNoYW5nZXMgaW4gdGhlIG5ldyAKPiBtYWNoaW5lIGRpcmVjdG9yeS4KPiDCoAo+IENvdWxkIHNv
bWVvbmUgcGxlYXNlIHN1Z2dlc3QgaG93IHRvIGdvIGFib3V0IGl0PyBBbHNvLCBpcyB0aGVyZSBh
IAo+IHN0YW5kYXJkIHN0ZXAgYnkgc3RlcCBtZXRob2QgYnkgd2hpY2ggd2UgY2FuIGFjaGlldmUg
dGhpcz8KCkknbSBvbmUgb2YgdGhlIGtlcm5lbC9xZW11IGhhY2tlcnMgb24gdGhlIHByb2plY3Qg
c28gWW9jdG8gYW5kIGl0cyBsYXllcnMgYXJlbid0IHJlYWxseSBteSBhcmVhIG9mIGtub3dsZWRn
ZSwgYnV0IEkgZXhwZWN0IHdlIHdvdWxkIGhhdmUgdG8gcHVsbCBGYWNlYm9vaydzIGxheWVycyBp
bnRvIG91ciBvcGVuYm1jL29wZW5ibWMgcmVwbyBmb3IgeW91IHRvIGJ1aWxkIG9uLiBJIGRvbid0
IGtub3cgaWYgdGhhdCdzIHNvbWV0aGluZyB3ZSB3b3VsZCBkbzogUGF0cmljayBhbmQgQnJhZCAo
bm93IGluIFRvOikgbWlnaHQgYmUgYWJsZSB0byBoZWxwIHlvdSBvdXQgaGVyZS4KCkNoZWVycywK
CkFuZHJldwoKPiDCoAo+IFRoYW5rcyBhbmQgUmVnYXJkcywKPiBUaWp1Cj4gwqAKCiogV2UncmUg
d29ya2luZyBwcmltYXJpbHkgb24gZW5hYmxpbmcgT3BlblBPV0VSIG1hY2hpbmVzIHdpdGggYW4g
b3BlbiBzb3VyY2UgQk1DLiBXZSBoYXBwZW4gdG8gdXNlIHRoZSBzYW1lIFNvQyBzZXJpZXMgKEFT
VDI0MDAvQVNUMjUwMCkgYXMgRmFjZWJvb2ssIHNvIHRoZXJlJ3MgYSBsb3Qgb2YgY3Jvc3Mtb3Zl
ciBpbiB1LWJvb3QvTGludXggYnV0IHRoZSB1c2Vyc3BhY2UgaXMgZmFpcmx5IGRpZmZlcmVudC4K
CkxlZ2FsIERpc2NsYWltZXI6ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNz
YWdlIG1heSBiZSBwcml2aWxlZ2VkIGFuZCBjb25maWRlbnRpYWwuIEl0IGlzIGludGVuZGVkIHRv
IGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcyBh
ZGRyZXNzZWQgb3IgYnkgdGhlaXIgZGVzaWduZWUuIElmIHRoZSByZWFkZXIgb2YgdGhpcyBtZXNz
YWdlIGlzIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCB5b3UgYXJlIG9uIG5vdGljZSB0aGF0
IGFueSBkaXN0cmlidXRpb24gb2YgdGhpcyBtZXNzYWdlLCBpbiBhbnkgZm9ybSwgaXMgc3RyaWN0
bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVycm9y
LCBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBvciBkZXN0
cm95IGFueSBjb3B5IG9mIHRoaXMgbWVzc2FnZSEK
