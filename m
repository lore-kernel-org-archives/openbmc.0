Return-Path: <SRS0=CQYq=FA=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4763FC56202
	for <openbmc@archiver.kernel.org>; Thu, 26 Nov 2020 01:10:41 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE932075A
	for <openbmc@archiver.kernel.org>; Thu, 26 Nov 2020 01:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE932075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChKSY2gstzDqpg
	for <openbmc@archiver.kernel.org>; Thu, 26 Nov 2020 12:10:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=he.huang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChJWR10JHzDqxV
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 11:28:01 +1100 (AEDT)
IronPort-SDR: j19nFSmmcDYjO11eyUQODks988vlF1sn/foYZlOqifzGBUrVkRBKbHtzXfeE0vdOVguZ0ML3z/
 RwRHO04HNusA==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="256926998"
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; 
 d="scan'208,217";a="256926998"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 16:27:59 -0800
IronPort-SDR: kpFt5PYHVlB8T6L0VbY0WqO2a3WOlVT/Z3M95tLN3FH9EBIXIwRKafxLVvMkYiOIpo6fXOQC50
 b3v0GCZxhFbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; 
 d="scan'208,217";a="371082365"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2020 16:27:59 -0800
Received: from huanghe-mobl (huanghe-mobl.ccr.corp.intel.com [10.239.16.21])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7E209580565;
 Wed, 25 Nov 2020 16:27:57 -0800 (PST)
Date: Thu, 26 Nov 2020 08:27:58 +0800
From: "he.huang" <he.huang@linux.intel.com>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>, "ed" <ed@tanous.net>,
 "jae.hyun.yoo" <jae.hyun.yoo@linux.intel.com>,
 "vernon.mauery" <vernon.mauery@linux.intel.com>,
 "openbmc" <openbmc@lists.ozlabs.org>
Subject: Re:  Re: Add size property of EEPROM device
In-Reply-To: <4e839c2d6723f6b2d6c4a990869093c09988d6d4.camel@fuzziesquirrel.com>
References: <5FBCB6EB.3080609@linux.intel.com>
 <4e839c2d6723f6b2d6c4a990869093c09988d6d4.camel@fuzziesquirrel.com>
X-Mailer: NetEase FlashMail 2.4.1.32
X-Priority: 3 (Normal)
MIME-Version: 1.0
Message-ID: <5FBEF68B.3020007@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="NetEase-FlashMail-003-28ca8f1c-993c-434f-8fd2-ff9ec2dcbcaf"
X-Mailman-Approved-At: Thu, 26 Nov 2020 12:05:47 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--NetEase-FlashMail-003-28ca8f1c-993c-434f-8fd2-ff9ec2dcbcaf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJhZCwNClllcywgZWVwcm9tIGRyaXZlciBjb3VsZCBoZWxwIHRoZSByZXF1aXJlbWVudCBw
YXJ0aWFsbHkuDQpBcyBFZCdzIGNvbW1lbnRzIG9uIHRoZSBwYXRjaCwgd2Ugc3RpbGwgbmVlZCB0
aGUgc2l6ZSBpbiB0aGUgdXBwZXIgbGV2ZWwgc3VjaCBhcyBJUE1JIGNvbW1hbmQgaGFuZGxlciwg
dG8gZGlmZmVyZW50aWF0ZSB0aGUgZXJyb3IgYmV0d2VlbiB3cml0aW5nIGZhaWxlZCBhbmQgd3Jp
dGluZyBvdXQgb2YgdGhlIHJhbmdlLCBhbmQgcmV0dXJuIHRoZSBjb3JyZWN0IGNvbXBsZXRlIGNv
ZGUuDQpUaGFua3MuDQoNCjIwMjAtMTEtMjYgDQoNCkhlbGVuLmh1YW5nIA0KDQoNCg0K5Y+R5Lu2
5Lq677yaQnJhZCBCaXNob3AgPGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4NCuWPkemAgeaX
tumXtO+8mjIwMjAtMTEtMjUgMjM6MzYNCuS4u+mimO+8mlJlOiBBZGQgc2l6ZSBwcm9wZXJ0eSBv
ZiBFRVBST00gZGV2aWNlDQrmlLbku7bkurrvvJoiaGUuaHVhbmciPGhlLmh1YW5nQGxpbnV4Lmlu
dGVsLmNvbT4sImVkIjxlZEB0YW5vdXMubmV0PiwiamFlLmh5dW4ueW9vIjxqYWUuaHl1bi55b29A
bGludXguaW50ZWwuY29tPiwidmVybm9uLm1hdWVyeSI8dmVybm9uLm1hdWVyeUBsaW51eC5pbnRl
bC5jb20+LCJvcGVuYm1jIjxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQrmioTpgIHvvJoNCg0K
T24gVHVlLCAyMDIwLTExLTI0IGF0IDE1OjMxICswODAwLCBoZS5odWFuZyB3cm90ZTogDQo+IFRo
ZSByZXF1aXJlbWVudCBjb21lcyBmcm9tOiANCj4gV2hlbiB3ZSB3cml0ZSB0byB0aGUgRUVQUk9N
IHdlIG5lZWQgdGhlIHNpemUgdG8gZW5zdXJlIHRoYXQgd2Ugd29uJ3QgDQo+IHdyaXRlIG91dCBv
ZiB0aGUgcmFuZ2UgYW5kIHJldHVybiB0aGUgY29ycmVjdCBjb21wbGV0ZSBjb2RlLiANCg0KRG9u
J3QgdGhlIGVlcHJvbSBkcml2ZXJzIHByZXZlbnQgdGhpcz8g

--NetEase-FlashMail-003-28ca8f1c-993c-434f-8fd2-ff9ec2dcbcaf
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYWwv
L0VOIj4NCjxIVE1MPjxIRUFEPg0KPE1FVEEgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0
Zi04IiBodHRwLWVxdWl2PUNvbnRlbnQtVHlwZT48IS0tIGZsYXNobWFpbCBzdHlsZSBiZWdpbiAt
LT4NCjxTVFlMRSB0eXBlPXRleHQvY3NzPgpib2R5IHtib3JkZXItd2lkdGg6MDttYXJnaW46MH0K
aW1nIHtib3JkZXI6MDttYXJnaW46MDtwYWRkaW5nOjB9CjwvU1RZTEU+DQo8QkFTRSB0YXJnZXQ9
X2JsYW5rPjwhLS0gZmxhc2htYWlsIHN0eWxlIGVuZCAtLT4NCjxNRVRBIG5hbWU9R0VORVJBVE9S
IGNvbnRlbnQ9Ik1TSFRNTCAxMS4wMC4xMDU3MC4xMDAxIj48L0hFQUQ+DQo8Qk9EWSANCnN0eWxl
PSJCT1JERVItTEVGVC1XSURUSDogMHB4OyBGT05ULVNJWkU6IDEwLjVwdDsgRk9OVC1GQU1JTFk6
IO+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/vTsgQk9SREVS
LVJJR0hULVdJRFRIOiAwcHg7IEJPUkRFUi1CT1RUT00tV0lEVEg6IDBweDsgQ09MT1I6ICMwMDAw
MDA7IE1BUkdJTjogMTJweDsgTElORS1IRUlHSFQ6IDEuNTsgQk9SREVSLVRPUC1XSURUSDogMHB4
IiANCm1hcmdpbmhlaWdodD0iMCIgbWFyZ2lud2lkdGg9IjAiPg0KPERJVj5IaSBCcmFkLDwvRElW
Pg0KPERJVj5ZZXMsIGVlcHJvbSZuYnNwO2RyaXZlciBjb3VsZCBoZWxwIHRoZSByZXF1aXJlbWVu
dCBwYXJ0aWFsbHkuPC9ESVY+DQo8RElWPkFzIEVkJ3MgY29tbWVudHMgb24gdGhlIHBhdGNoLCZu
YnNwO3dlIHN0aWxsJm5ic3A7bmVlZCB0aGUgc2l6ZSBpbiB0aGUgDQp1cHBlciBsZXZlbCBzdWNo
IGFzIElQTUkgY29tbWFuZCBoYW5kbGVyLCB0byBkaWZmZXJlbnRpYXRlIHRoZSBlcnJvciBiZXR3
ZWVuIA0Kd3JpdGluZyBmYWlsZWQgYW5kIHdyaXRpbmcgb3V0IG9mIHRoZSByYW5nZSwgYW5kIHJl
dHVybiB0aGUgY29ycmVjdCBjb21wbGV0ZSANCmNvZGUuPC9ESVY+DQo8RElWPjxTUEFOIA0Kc3R5
bGU9J0ZPTlQtU0laRTogMTNweDsgRk9OVC1GQU1JTFk6IFJvYm90bywgLWFwcGxlLXN5c3RlbSwg
QmxpbmtNYWNTeXN0ZW1Gb250LCAiU2Vnb2UgVUkiLCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNl
cmlmLCAiQXBwbGUgQ29sb3IgRW1vamkiLCAiU2Vnb2UgVUkgRW1vamkiLCAiU2Vnb2UgVUkgU3lt
Ym9sIjsgV0hJVEUtU1BBQ0U6IHByZS13cmFwOyBXT1JELVNQQUNJTkc6IDBweDsgVEVYVC1UUkFO
U0ZPUk06IG5vbmU7IEZMT0FUOiBub25lOyBGT05ULVdFSUdIVDogNDAwOyBDT0xPUjogcmdiKDMz
LDMzLDMzKTsgRk9OVC1TVFlMRTogbm9ybWFsOyBPUlBIQU5TOiAyOyBXSURPV1M6IDI7IERJU1BM
QVk6IGlubGluZSAhaW1wb3J0YW50OyBMRVRURVItU1BBQ0lORzogbm9ybWFsOyBCQUNLR1JPVU5E
LUNPTE9SOiByZ2IoMjU1LDI1NSwyNTUpOyBURVhULUlOREVOVDogMHB4OyBmb250LXZhcmlhbnQt
bGlnYXR1cmVzOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IC13ZWJraXQtdGV4
dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0
LWRlY29yYXRpb24tY29sb3I6IGluaXRpYWwnPlRoYW5rcy48L1NQQU4+PC9ESVY+DQo8RElWPiZu
YnNwOzwvRElWPg0KPERJViBzdHlsZT0iRk9OVC1TSVpFOiAxMHB0OyBGT05ULUZBTUlMWTogVmVy
ZGFuYTsgQ09MT1I6ICNjMGMwYzAiIA0KYWxpZ249bGVmdD4yMDIwLTExLTI2IA0KPEhSIGlkPVNp
Z25OYW1lSFIgDQpzdHlsZT0iQk9SREVSLVRPUDogI2MwYzBjMCAxcHggc29saWQ7IEhFSUdIVDog
MXB4OyBCT1JERVItUklHSFQ6IDBweDsgV0lEVEg6IDEyMnB4OyBCT1JERVItQk9UVE9NOiAwcHg7
IEJPUkRFUi1MRUZUOiAwcHgiIA0KYWxpZ249bGVmdD4NCjxTUEFOIGlkPV9GbGFzaFNpZ25OYW1l
PkhlbGVuLmh1YW5nPC9TUEFOPiA8L0RJVj4NCjxIUiANCnN0eWxlPSJCT1JERVItVE9QOiAjYzBj
MGMwIDFweCBzb2xpZDsgSEVJR0hUOiAxcHg7IEJPUkRFUi1SSUdIVDogMHB4OyBCT1JERVItQk9U
VE9NOiAwcHg7IEJPUkRFUi1MRUZUOiAwcHgiPg0KDQo8QkxPQ0tRVU9URSBpZD1udGVzLWZsYXNo
bWFpbC1xdW90ZSANCnN0eWxlPSJGT05ULVNJWkU6IDEwcHQ7IEZPTlQtRkFNSUxZOiBWZXJkYW5h
OyBQQURESU5HLUxFRlQ6IDBweDsgTUFSR0lOLUxFRlQ6IDBweCI+DQogIDxESVY+PFNUUk9ORz7l
j5Hku7bkurrvvJo8L1NUUk9ORz5CcmFkIEJpc2hvcCANCiZsdDticmFkbGV5YkBmdXp6aWVzcXVp
cnJlbC5jb20mZ3Q7PC9ESVY+DQogIDxESVY+PFNUUk9ORz7lj5HpgIHml7bpl7TvvJo8L1NUUk9O
Rz4yMDIwLTExLTI1Jm5ic3A7MjM6MzY8L0RJVj4NCiAgPERJVj48U1RST05HPuS4u+mimO+8mjwv
U1RST05HPlJlOiBBZGQgc2l6ZSBwcm9wZXJ0eSBvZiBFRVBST00gZGV2aWNlPC9ESVY+DQogIDxE
SVY+PFNUUk9ORz7mlLbku7bkurrvvJo8L1NUUk9ORz4iaGUuaHVhbmciJmx0O2hlLmh1YW5nQGxp
bnV4LmludGVsLmNvbSZndDssImVkIiZsdDtlZEB0YW5vdXMubmV0Jmd0OywiamFlLmh5dW4ueW9v
IiZsdDtqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tJmd0OywidmVybm9uLm1hdWVyeSImbHQ7
dmVybm9uLm1hdWVyeUBsaW51eC5pbnRlbC5jb20mZ3Q7LCJvcGVuYm1jIiZsdDtvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmcmZ3Q7PC9ESVY+DQogIDxESVY+PFNUUk9ORz7mioTpgIHvvJo8L1NUUk9O
Rz48L0RJVj4NCiAgPERJVj4mbmJzcDs8L0RJVj4NCiAgPERJVj4NCiAgPERJVj5PbiZuYnNwO1R1
ZSwmbmJzcDsyMDIwLTExLTI0Jm5ic3A7YXQmbmJzcDsxNTozMSZuYnNwOyswODAwLCZuYnNwO2hl
Lmh1YW5nJm5ic3A7d3JvdGU6Jm5ic3A7PC9ESVY+DQogIDxESVY+Jmd0OyZuYnNwO1RoZSZuYnNw
O3JlcXVpcmVtZW50Jm5ic3A7Y29tZXMmbmJzcDtmcm9tOiZuYnNwOzwvRElWPg0KICA8RElWPiZn
dDsmbmJzcDtXaGVuJm5ic3A7d2UmbmJzcDt3cml0ZSZuYnNwO3RvJm5ic3A7dGhlJm5ic3A7RUVQ
Uk9NJm5ic3A7d2UmbmJzcDtuZWVkJm5ic3A7dGhlJm5ic3A7c2l6ZSZuYnNwO3RvJm5ic3A7ZW5z
dXJlJm5ic3A7dGhhdCZuYnNwO3dlJm5ic3A7d29uJ3QmbmJzcDs8L0RJVj4NCiAgPERJVj4mZ3Q7
Jm5ic3A7d3JpdGUmbmJzcDtvdXQmbmJzcDtvZiZuYnNwO3RoZSZuYnNwO3JhbmdlJm5ic3A7YW5k
Jm5ic3A7cmV0dXJuJm5ic3A7dGhlJm5ic3A7Y29ycmVjdCZuYnNwO2NvbXBsZXRlJm5ic3A7Y29k
ZS4mbmJzcDs8L0RJVj4NCiAgPERJVj4mbmJzcDs8L0RJVj4NCiAgPERJVj5Eb24ndCZuYnNwO3Ro
ZSZuYnNwO2VlcHJvbSZuYnNwO2RyaXZlcnMmbmJzcDtwcmV2ZW50Jm5ic3A7dGhpcz8mbmJzcDs8
L0RJVj48L0RJVj48L0JMT0NLUVVPVEU+PC9CT0RZPjwvSFRNTD4=

--NetEase-FlashMail-003-28ca8f1c-993c-434f-8fd2-ff9ec2dcbcaf--

