Return-Path: <Balaji.B.Rao@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.220; helo=esa2.dell-outbound.iphmx.com;
 envelope-from=balaji.b.rao@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="g6bA/eOQ"; 
 dkim-atps=neutral
Received: from esa2.dell-outbound.iphmx.com (esa2.dell-outbound.iphmx.com
 [68.232.149.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLflc1mlPzF0TW
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 06:04:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1516129452; x=1547665452;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=35+5mNF+SIFl0CruhsE4EG7kW0ZcJRehX6hp1FXh1fA=;
 b=g6bA/eOQ84vN/fvhkTHW4Q9IxJ+Ko7FBrGa2InkyK3gbVwrMZyD1T1X1
 LQFxJOGRGYNHqneWzLpE4Rsfw96562DVIrvenxEtcoIcmE9V9UxKeu4LJ
 jGl4/tQ3SzdiabAJxaSCfmhyIv1tkDcnKg+wvxpn7ePrcXGiMMubRMWc8 g=;
IronPort-PHdr: =?us-ascii?q?9a23=3AK37ZXRTLXm48Ax4hLDBnWBWFutpsv+yvbD5Q0YIu?=
 =?us-ascii?q?jvd0So/mwa69YhCN2/xhgRfzUJnB7Loc0qyK6/mmATRIyK3CmUhKSIZLWR4BhJ?=
 =?us-ascii?q?detC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBxrwKxd+?=
 =?us-ascii?q?KPjrFY7OlcS30P2594HObwlSizexfa5+IA+qoQnNq8IbnZZsJqEtxxXTv3BGYf?=
 =?us-ascii?q?5WxWRmJVKSmxbz+MK994N9/ipTpvws6ddOXb31cKokQ7NYCi8mM30u683wqRbD?=
 =?us-ascii?q?VwqP6WACXWgQjxFFHhLK7BD+Xpf2ryv6qu9w0zSUMMHqUbw5Xymp4qF2QxHqlS?=
 =?us-ascii?q?gHLSY0/mHJhMJtkKJVrhGvpxJ9zI7VfI6bO/Vxc7jBfdwBR2pNQtpdWzBDD466?=
 =?us-ascii?q?coABD/ABPeFdr4TloFYDsAGxBQ22C+Ptyz9EnGL70bcm3es7FgHLxxEvEMwKsH?=
 =?us-ascii?q?TQttn6KKASUeWswaTO0D7NbOtW1C/85YXLaBwtv/+BUaxqfcbMyUQiGBnJg1GT?=
 =?us-ascii?q?pID9Ij+Zyv4Bv3WU4uduT+6jlWEqpx9rrjWtxsogkpTFi40bx1ze6Cl0wYc4Kc?=
 =?us-ascii?q?elREN0YtOoCoVcuz+UOoZwX8gsWXtnuDwgxb0DoZO7eS8Kx4k5yBPHcPyHdpSI?=
 =?us-ascii?q?4grkVOaMPTd0nHJld6y7hxa16UWv1Pb8WdO73VpQsyVKjN3MtnQU2xzU98iHVu?=
 =?us-ascii?q?By/kC82TaJyg/f9PtIIUEslarbLp4gzaQ8mYYUsUTGBiP2mUP2g7GKdkg8++Wl?=
 =?us-ascii?q?6P7rbqvoq5OCLYN4lwHzP6s0lsG7Auk0Kg0OUHKa+eS42r3j50r5QLBSg/AriK?=
 =?us-ascii?q?bZtIrVJcYapqKjHgJZyJot5Ay4Dzq9zdsXg30HLFZfdB2biIjpPknCIOrkAven?=
 =?us-ascii?q?n1SsjDBryujBPr35HJrNKGPMkLL9crtm705cyREzzcxE555ODbEAIfbzVVXqu9?=
 =?us-ascii?q?zDFBM5NBa0w+m0QOl6g9ccXm+LKq2cK+XTvRmB+7R8DfOLYdpBkj/5IvokodSo?=
 =?us-ascii?q?t3Y+sVMQea3v1pwSPiPrVs96KlmUNCK/yuwKFn0H61Iz?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HrAACKS15ah2Ka6ERbGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQXgQQnB4QMmQWCAokGhjyKAAoYhSMCGoRCQhUBAQEBAQEBAQE?=
 =?us-ascii?q?BAhABAQEKCwkIKC+COCKCSgEBAQQBIhFFDAQCAQgRBAEBAQICIwMCAgIfBx4BC?=
 =?us-ascii?q?AgBAQQOBQiKEwMVpUiCJ4c8DYIEAQEBAQYBAQEBAQEBAQEfgQ+FQoY4NoJrRAS?=
 =?us-ascii?q?BdjMSgkuCZQWjJz0KjyuBFIR5giKGHYtajX6JJ4E8NYF0b4J8gmSBc3gBiziBF?=
 =?us-ascii?q?wEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2HrAACKS15ah2Ka6ERbGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?XgQQnB4QMmQWCAokGhjyKAAoYhSMCGoRCQhUBAQEBAQEBAQEBAhABAQEKCwkIK?=
 =?us-ascii?q?C+COCKCSgEBAQQBIhFFDAQCAQgRBAEBAQICIwMCAgIfBx4BCAgBAQQOBQiKEwM?=
 =?us-ascii?q?VpUiCJ4c8DYIEAQEBAQYBAQEBAQEBAQEfgQ+FQoY4NoJrRASBdjMSgkuCZQWjJ?=
 =?us-ascii?q?z0KjyuBFIR5giKGHYtajX6JJ4E8NYF0b4J8gmSBc3gBiziBFwEBAQ?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa2.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2018 13:04:07 -0600
From: <Balaji.B.Rao@dell.com>
Received: from ausxipps301.us.dell.com ([143.166.148.223])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2018 01:04:07 +0600
X-LoopCount0: from 10.166.132.23
X-IronPort-AV: E=Sophos;i="5.46,369,1511848800"; d="scan'208";a="114186012"
X-DLP: DLP_GlobalPCIDSS
To: <joel@jms.id.au>
CC: <openbmc@lists.ozlabs.org>
Subject: RE: Issue with flash space overflow? Maybe?
Thread-Topic: Issue with flash space overflow? Maybe?
Thread-Index: AdOOIcqPo13oWnLsTT+kI7Q9rwqDBQARtd6AACUEGTA=
Date: Tue, 16 Jan 2018 19:04:06 +0000
Message-ID: <7c0af2d45e544ac3b3a9d720c783a3e0@ausx13mpc109.AMER.DELL.COM>
References: <703062ea845f4553be9065a2d5b6eb61@ausx13mpc109.AMER.DELL.COM>
 <CACPK8XeVo23u+o55tu0YW_eT8ncZjBmVhisFpCbBNCvoJ7h7Vg@mail.gmail.com>
In-Reply-To: <CACPK8XeVo23u+o55tu0YW_eT8ncZjBmVhisFpCbBNCvoJ7h7Vg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiIwN2NlZjg2OC1iYjkwLTRhYzgtYmEyZS1jNGIwMTE5NjhlMGUiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6IldHbnR4MythTUxJVFVaRXY4WkJhZ0dBaUJzTXVkRW5lS1BDNUppZjNIbDQ9In0=
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 16 Jan 2018 19:04:13 -0000

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
