Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rL670XSDzDrbK
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 15:04:26 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2018 22:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,431,1520924400"; 
 d="dat'59?scan'59,208,59";a="43486816"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.15])
 by orsmga008.jf.intel.com with ESMTP; 22 May 2018 22:04:22 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: <openbmc@lists.ozlabs.org>,
	<chou.brad@gmail.com>
Subject: Re: How to power on Intel x86 based CPUs
Date: Wed, 23 May 2018 13:04:21 +0800
Message-ID: <000401d3f253$8385fcc0$8a91f640$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_0005_01D3F296.91A9D900"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AdPyU0Atv+wezhFXQGq4BVUp3mfiSA==
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODQ2NzJiNjMtNjYwZi00YTQ0LTg3MjgtOTc2OTU0OTgyZmM5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMXpNTDlRaXgzUWJkSkpTem9HaFFtRkFWVnF3M2pqK2NkM1Mzb0tQVFpjS2hQMVZJczloOHBkUG9DSXhoWVVNSiJ9
X-MS-TNEF-Correlator: 00000000B6C74CAB317A6D4C8738201522A4ABE2A4BA2000
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
X-List-Received-Date: Wed, 23 May 2018 05:04:31 -0000

This is a multipart message in MIME format.

------=_NextPart_000_0005_01D3F296.91A9D900
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Brad,

We(Intel) finished chassis/power control based on sdbusplus for Intel
platforms, and starting to upstream. 
Official release will be available in github soon.

Thanks,
Yong Li

------=_NextPart_000_0005_01D3F296.91A9D900
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

eJ8+IhYFAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAAqAMAAAAAAACrAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQOQBgCcCAAAKAAAAAsAAgABAAAAAwAmAAAAAAALACkAAAAAAB4A
cAABAAAAKQAAAFJlOiBIb3cgdG8gcG93ZXIgb24gSW50ZWwgeDg2IGJhc2VkIENQVXMAAAAAAgFx
AAEAAAAWAAAAAdPyU0Atv+wezhFXQGq4BVUp3mfiSAAACwABDgAAAAACAQoOAQAAABgAAAAAAAAA
tsdMqzF6bUyHOCAVIqSr4sKAAAADABQOAQAAAB4AKA4BAAAAPQAAADAwMDAwMDA0AXlvbmcuYi5s
aUBsaW51eC5pbnRlbC5jb20BeW9uZy5iLmxpQGxpbnV4LmludGVsLmNvbQAAAAAeACkOAQAAAD0A
AAAwMDAwMDAwNAF5b25nLmIubGlAbGludXguaW50ZWwuY29tAXlvbmcuYi5saUBsaW51eC5pbnRl
bC5jb20AAAAAAwDeP59OAAADAPE/CQQAAB4A+j8BAAAAFAAAAHlvbmcuYi5saUBpbnRlbC5jb20A
AwAJWQEAAAALABWACCAGAAAAAADAAAAAAAAARgAAAAADhQAAAAAAAAMAGoAIIAYAAAAAAMAAAAAA
AABGAAAAAAGFAAAAAAAAAwAtgAggBgAAAAAAwAAAAAAAAEYAAAAAEIUAAAAAAAALAF6ACCAGAAAA
AADAAAAAAAAARgAAAAAGhQAAAAAAAAsAYoAIIAYAAAAAAMAAAAAAAABGAAAAAA6FAAAAAAAAAwBl
gAggBgAAAAAAwAAAAAAAAEYAAAAAGIUAAAAAAAALAHuACCAGAAAAAADAAAAAAAAARgAAAACChQAA
AQAAAAMAuIAIIAYAAAAAAMAAAAAAAABGAAAAAOuFAAAJBAAAHgC7gIYDAgAAAAAAwAAAAAAAAEYB
AAAAKAAAAHgALQBjAHQAcABjAGwAYQBzAHMAaQBmAGkAYwBhAHQAaQBvAG4AAAABAAAABwAAAENU
UF9OVAAAHgC8gIYDAgAAAAAAwAAAAAAAAEYBAAAAKAAAAHgALQB0AGkAdAB1AHMALQBtAGUAdABh
AGQAYQB0AGEALQA0ADAAAAABAAAAqQEAAGV5SkRZWFJsWjI5eWVVeGhZbVZzY3lJNklpSXNJazFs
ZEdGa1lYUmhJanA3SW01eklqb2lhSFIwY0RwY0wxd3ZkM2QzTG5ScGRIVnpMbU52YlZ3dmJuTmNM
MGx1ZEdWc015SXNJbWxrSWpvaU9EUTJOekppTmpNdE5qWXdaaTAwWVRRMExUZzNNamd0T1RjMk9U
VTBPVGd5Wm1NNUlpd2ljSEp2Y0hNaU9sdDdJbTRpT2lKRFZGQkRiR0Z6YzJsbWFXTmhkR2x2YmlJ
c0luWmhiSE1pT2x0N0luWmhiSFZsSWpvaVExUlFYMDVVSW4xZGZWMTlMQ0pUZFdKcVpXTjBUR0Zp
Wld4eklqcGJYU3dpVkUxRFZtVnljMmx2YmlJNklqRTNMakV3TGpFNE1EUXVORGtpTENKVWNuVnpk
R1ZrVEdGaVpXeElZWE5vSWpvaU1YcE5URGxSYVhnelVXSmtTa3BUZW05SGFGRnRSa0ZXVm5GM00y
cHFLMk5rTTFNemIwdFFWRnBqUzJoUU1WWkpjemxvT0hCa1VHOURTWGhvV1ZWTlNpSjkAAAAAHgC+
gCkDAgAAAAAAwAAAAAAAAEYBAAAAJAAAAEMAVABQAEMAbABhAHMAcwBpAGYAaQBjAGEAdABpAG8A
bgAAAAEAAAAHAAAAQ1RQX05UAAAeAPWAKQMCAAAAAADAAAAAAAAARgEAAAAsAAAAVABpAHQAdQBz
AFMAZQBuAGQAVQBzAGkAbgBnAEEAYwBjAG8AdQBuAHQAAAABAAAAiQAAAGV5SkJaR1J5WlhOeklq
b2lJaXdpUkc5dFlXbHVJam9pYkdsdWRYZ3VhVzUwWld3dVkyOXRJaXdpVG1GdFpTSTZJbGx2Ym1j
Z1RHa2lMQ0pUVFZSUVFXUmtjbVZ6Y3lJNklubHZibWN1WWk1c2FVQnNhVzUxZUM1cGJuUmxiQzVq
YjIwaWZRPT0AAAAACwAfDgEAAAACAfgPAQAAABAAAAC2x0yrMXptTIc4IBUipKviAgH6DwEAAAAQ
AAAAtsdMqzF6bUyHOCAVIqSr4gMA/g8FAAAAAgEJEAEAAABSAQAATgEAAOYBAABMWkZ1v5HzPwMA
CgByY3BnMTI1IjIDQ3RleAVCYmn+ZAQAAzABAwH3CoACpAPk/wcTAoAQcwBQBFYIVQeyEaUnDlED
AQIAY2gKwHNl3HQyBgAGwxGlMwRGFDfeMBKsEbMI7wn3OxifDjB2NRGiDGBjAFALCQFkMwY2FtAL
piBIaSBCcHJhZCwKogqECoBXCGUoSQIwZWwpINZmC4AEAGgJgCAUUQQQ4QQAL3BvdxMBBaACMDsD
YAMgYiAAH7ECICBz8GRidXMLUCIAH0AFsR0e4yALUQAwBbBtcyx2IABwH8BzAZAAIAuAZ8AgdG8g
dXAkABig2GFtLgrjCoBPASAN4LUHMSAYoGwlEBSQIAPw5mwhISawYXYLcAtgAmADJrALgCBnaXRo
dapiIcBvAiAuHfpUFGBsbmsjkB30WQIgJHBMCwCgHgN9K1AAAAMADTT9P6UOAwAPNP0/pQ4CARQ0
AQAAABAAAABOSVRB+b+4AQCqADfZbgAAAgF/AAEAAAAxAAAAMDAwMDAwMDBCNkM3NENBQjMxN0E2
RDRDODczODIwMTUyMkE0QUJFMkE0QkEyMDAwAAAAAAMABhBUKCzuAwAHEJoAAAADABAQAAAAAAMA
ERAAAAAAHgAIEAEAAABlAAAASElCUkFELFdFKElOVEVMKUZJTklTSEVEQ0hBU1NJUy9QT1dFUkNP
TlRST0xCQVNFRE9OU0RCVVNQTFVTRk9SSU5URUxQTEFURk9STVMsQU5EU1RBUlRJTkdUT1VQU1RS
RUFNTwAAAACfCA==

------=_NextPart_000_0005_01D3F296.91A9D900--
