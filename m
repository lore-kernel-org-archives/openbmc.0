Return-Path: <Balaji.B.Rao@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=balaji.b.rao@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="iyP7Jijq"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLYgZ4VkgzDqZH
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 02:14:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1516115722; x=1547651722;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=35+5mNF+SIFl0CruhsE4EG7kW0ZcJRehX6hp1FXh1fA=;
 b=iyP7Jijq2dN0h3DJdeP7ge7FV/eDNpFc+8Q/cqjDKOFJ3GcmUWYcPpPK
 mcHiQe1zrydM64PNdAx+Zo6gg75H57fzdI1z7FsiK7LlRuMaksmE6JQjr
 dKTtr6WUL9IlgxV7ZGHLBGAzLGVwcnxfeS/dxBnGy+EXKAzLqVGzAFcsQ s=;
IronPort-PHdr: =?us-ascii?q?9a23=3ANbD2zxSvIY+uHxV4dFy5Qm239tpsv+yvbD5Q0YIu?=
 =?us-ascii?q?jvd0So/mwa69YhaN2/xhgRfzUJnB7Loc0qyK6/mmATRIyK3CmUhKSIZLWR4BhJ?=
 =?us-ascii?q?detC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBxrwKxd+?=
 =?us-ascii?q?KPjrFY7OlcS30P2594HObwlSizexfa5+IA+qoQnNq8IbnZZsJqEtxxXTv3BGYf?=
 =?us-ascii?q?5WxWRmJVKSmxbz+MK994N9/ipTpvws6ddOXb31cKokQ7NYCi8mM30u683wqRbD?=
 =?us-ascii?q?VwqP6WACXWgQjxFFHhLK7BD+Xpf2ryv6qu9w0zSUMMHqUbw5Xymp4qF2QxHqlS?=
 =?us-ascii?q?gHLSY0/mHJhMJtkKJVrhGvpxJ9zI7VfI6bO/Vxc7jBfdwBR2pNQtpdWzBDD466?=
 =?us-ascii?q?coABD/ABPeFdr4TloFYDsAGxBQ22C+Ptyz9EnGL70bcm3es7FgHLxxEvEMwKsH?=
 =?us-ascii?q?TQttn6KKASUeWswaTO0D7NbOtW1C/85YXLaBwtv/+BUaxqfcbMyUQiGBnJg1Se?=
 =?us-ascii?q?pID9Ij+Zyv4Bv3WU4uduT+6jlWEqpx9rrjWtxsogkpTFi40bx1ze6Cl0wYc4Kc?=
 =?us-ascii?q?e7RUN7e9KoDodcuiCcOoBrWM0tWXtotzw/yrAevJ67ezUFx4o/yh7EbvyHb5CI?=
 =?us-ascii?q?4hX+VOaNOTt4hGxqeLa4hxuq70eg0ffzW8eu3FlXsCVFlt3MumkK1xzO9siIUf?=
 =?us-ascii?q?x9/lqn2TmSyQzf8OBEIVg0lareJJ8t2KI/lp0WsUjbHy/2nlv5jLOOe0gl+eWk?=
 =?us-ascii?q?8frrb7v4qpOGKoN5ig7zPr4vl8GxGeg4NxIBX2mf+eSyzr3j+kj5Ta1Xg/Islq?=
 =?us-ascii?q?nWqpLaJcUBqqOkGQNbzpws6xGkAji7ztsYmX0HIEhZdxKAiojlI0vOL+zgDfej?=
 =?us-ascii?q?n1Ssly9mx/fePrL/BJXCNX3Dn6v6cLZ56k5c0xYzzctF65JTC7ABJOj8VVTqtN?=
 =?us-ascii?q?DCCR85KQO0kK7bD4Ap1IQTXUqNB7TfMa+UuELetcw1JOzZMKUcvD//Kr4PocTn?=
 =?us-ascii?q?ilc1lFsZO6Ku2M1EOziDAv16LhDBMjLXidAbHDJSsw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HkAQCQFV5ahz+a6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQXgQQnB4QMmQSCAokGhjyKAAoYhSMCGoRCQhUBAQEBAQEBAQE?=
 =?us-ascii?q?BAhABAQEKCwkIKC+COCKCSgEBAQEDASIRRQwEAgEIEQQBAQECAiMDAgICHwceA?=
 =?us-ascii?q?QgIAQEEDgUIihMDFaVZgieHOQ2CBAEBAQEGAQEBAQEBAQEBH4EPhUKGODaCa0Q?=
 =?us-ascii?q?EgXYzEoJLgmUFoyc9Co8rgRSEeYIihh2LWo1+iSeBPDWBdG+CfIJkgXN4AYwng?=
 =?us-ascii?q?RcBAQE?=
X-IPAS-Result: =?us-ascii?q?A2HkAQCQFV5ahz+a6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?XgQQnB4QMmQSCAokGhjyKAAoYhSMCGoRCQhUBAQEBAQEBAQEBAhABAQEKCwkIK?=
 =?us-ascii?q?C+COCKCSgEBAQEDASIRRQwEAgEIEQQBAQECAiMDAgICHwceAQgIAQEEDgUIihM?=
 =?us-ascii?q?DFaVZgieHOQ2CBAEBAQEGAQEBAQEBAQEBH4EPhUKGODaCa0QEgXYzEoJLgmUFo?=
 =?us-ascii?q?yc9Co8rgRSEeYIihh2LWo1+iSeBPDWBdG+CfIJkgXN4AYwngRcBAQE?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2018 09:14:50 -0600
From: <Balaji.B.Rao@dell.com>
Received: from ausc60pc101.us.dell.com ([143.166.85.206])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2018 21:07:22 +0600
X-LoopCount0: from 10.166.132.72
X-IronPort-AV: E=Sophos;i="5.46,368,1511848800"; d="scan'208";a="1202368682"
X-DLP: DLP_GlobalPCIDSS
To: <joel@jms.id.au>
CC: <openbmc@lists.ozlabs.org>
Subject: RE: Issue with flash space overflow? Maybe?
Thread-Topic: Issue with flash space overflow? Maybe?
Thread-Index: AdOOIcqPo13oWnLsTT+kI7Q9rwqDBQARtd6AABzpHyA=
Date: Tue, 16 Jan 2018 15:14:48 +0000
Message-ID: <d1ba8d62a46a42899e9caba4c021f014@ausx13mpc109.AMER.DELL.COM>
References: <703062ea845f4553be9065a2d5b6eb61@ausx13mpc109.AMER.DELL.COM>
 <CACPK8XeVo23u+o55tu0YW_eT8ncZjBmVhisFpCbBNCvoJ7h7Vg@mail.gmail.com>
In-Reply-To: <CACPK8XeVo23u+o55tu0YW_eT8ncZjBmVhisFpCbBNCvoJ7h7Vg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiIxYjI5ZmUzZS03ODQzLTRjNGEtODhmOC0zNTVlZTkyNmZmMDkiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjhUSXVEZFhvaStIeDU3ZDM4bUduMWMyMEJhWEJxR2ExMTBqVzlmY0lZNG89In0=
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jan 2018 15:06:53 +1100
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
X-List-Received-Date: Tue, 16 Jan 2018 15:15:24 -0000

Sm9lbCwNCg0KSSBkaWRu4oCZdCBjaGFuZ2UgYW55IGJ1aWxkIHBhcmFtZXRlcnMsIGJ1dCB0aGUg
cHl0aG9uIHBhY2thZ2VzLiBJdCBjbGVhcmx5IGJ1aWxkcyB3ZWxsIHdoZW4gdGhlIG51bWJlciBv
ZiBwYWNrYWdlcyBhcmUgbG93ZXIuIEhvd2V2ZXIgYXMgSSBhZGQgbW9yZSBwYWNrYWdlcywgSSBz
ZWUgdGhpcyBpc3N1ZS4gV2hpbGUgSSdkIGxpa2UgdG8gaW52ZXN0aWdhdGUgSkZGUzIga2VybmVs
IG9wdGlvbnMgYXMgeW91IHN1Z2dlc3RlZCwgSSdtIGxlYW5pbmcgdG93YXJkIGZsYXNoIHNwYWNl
LiBJcyB0aGVyZSBhIHdheSB0byBmaW5kIGlmIHRoYXQgaXMgdGhlIGNhc2U/DQoNClRoYW5rcw0K
QmFsYWppDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBqb2VsLnN0YW5AZ21h
aWwuY29tIFttYWlsdG86am9lbC5zdGFuQGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mIEpvZWwgU3Rh
bmxleQ0KU2VudDogTW9uZGF5LCBKYW51YXJ5IDE1LCAyMDE4IDE6MjQgUE0NClRvOiBSYW8sIEJh
bGFqaSBCIDxCYWxhamlfQl9SYW9AZGVsbC5jb20+DQpDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IElzc3VlIHdpdGggZmxhc2ggc3Bh
Y2Ugb3ZlcmZsb3c/IE1heWJlPw0KDQpPbiBNb24sIEphbiAxNSwgMjAxOCBhdCA4OjU3IEFNLCAg
PEJhbGFqaS5CLlJhb0BkZWxsLmNvbT4gd3JvdGU6DQo+IE9uIFBhbG1ldHRvLCB3aGVuIEkgZmxh
c2ggYSBidWlsZCwgSSBnZXQgdGhpcyBlcnJvci4gTmV0Ym9vdCBmcm9tIHRoZSANCj4gc2FtZSBp
bWFnZSB3b3JrcywgaG93ZXZlciB3aGVuIEkgZmxhc2ggYnkgY29weWluZyB0aGUgc3RhdGljLm10
ZCANCj4gaW1hZ2UsIEkgc2VlIHRoaXMgaXNzdWUuIEnigJltIHRyeWluZyB0byBhZGQgYSBidW5j
aCBvZiBweXRob24gcGFja2FnZXMgDQo+IHRvIHRoZSBidWlsZC4gQ291bGQgaXQgYmUgYSBmbGFz
aCBzcGFjZSBpc3N1ZT8gUGxlYXNlIGFkdmlzZSBpZiANCj4gYW55Ym9keSBoYXMgYW55IHRob3Vn
aHRzIG9uIHRoaXMgYW5kIGhvdyB0aGlzIGNhbiBiZSBvdmVyY29tZT8NCg0KPiBbICAgIDguMDYw
MDAwXSBqZmZzMjogamZmczJfc2Nhbl9lcmFzZWJsb2NrKCk6IE1hZ2ljIGJpdG1hc2sgMHgxOTg1
IG5vdA0KPiBmb3VuZCBhdCAweDAwMDAwMDBjOiAweDZhODkgaW5zdGVhZA0KDQpZb3UgbmVlZCB0
byBlbnN1cmUgdGhlIEpGRlMyIGtlcm5lbCBvcHRpb25zIGFyZSB0aGUgc2FtZSBmb3IgYm90aCB5
b3VyIG5ldGJvb3QgYW5kIGZsYXNoZWQga2VybmVscy4gVGhlIHdhcm5pbmdzIHlvdSBzZWUgYmVs
b3cgYWJvdXQgamZmczJfc2Nhbl9lcmFzZWJsb2NrIGFyZSBkdWUgdG8gYSBtaXNtYXRjaCBiZXR3
ZWVuIHRoZSBzZXR0aW5ncy4NCg0KQ2hlZXJzLA0KDQpKb2VsDQo=
