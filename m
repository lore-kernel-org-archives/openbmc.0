Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZHDs4zWpzDqcw
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 16:07:24 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2019 21:07:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,456,1539673200"; d="scan'208";a="136604576"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.197.142])
 by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2019 21:07:21 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>
Cc: "'Tanous, Ed'" <ed.tanous@intel.com>,
	<openbmc@lists.ozlabs.org>
References: <000001d4a7c9$bb643a40$322caec0$@linux.intel.com>
 <CDCE2036-F411-4B23-96ED-5C79F782E259@fuzziesquirrel.com>
In-Reply-To: <CDCE2036-F411-4B23-96ED-5C79F782E259@fuzziesquirrel.com>
Subject: RE: https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16468/
 needs your review
Date: Wed, 9 Jan 2019 13:07:21 +0800
Message-ID: <000501d4a7d9$341e2680$9c5a7380$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGXcPOejD69m91hR/NQwv+uUpY+FAHK96udphJ1/aA=
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGZkOTUyYzctMjNjMC00Zjg4LThlYTEtMDUyNzc3YWEyMzc5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieTg5M01yNTlhR0pUYnFjTVRNRUw5Q0lRM0JOb1wvWVwvRlZkT3lQcWFIMzUrUEJMTzF5K3VpbzZcL1h1Y25mdXZzMCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
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
X-List-Received-Date: Wed, 09 Jan 2019 05:07:26 -0000

Hi Brad,

Thanks for your mail. For this change, It should be better to add it =
into 2.6.
Based on this change, I will start to add the implementation in the IPMI =
watchdog command.

Thanks,
Yong
-----Original Message-----
From: Brad Bishop <bradleyb@fuzziesquirrel.com>=20
Sent: Wednesday, January 9, 2019 11:35 AM
To: Yong Li <yong.b.li@linux.intel.com>
Cc: Tanous, Ed <ed.tanous@intel.com>
Subject: Re: =
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+=
/16468/ needs your review


> On Jan 8, 2019, at 10:16 PM, Yong Li <yong.b.li@linux.intel.com> =
wrote:
>=20
> HI Brad,
> =20
> Sorry to disturbing, but the below code review is idle for serval =
days:
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interface
> s/+/16468/
> =20
> several reviewers had =E2=80=9C+1=E2=80=9D, could you help to review =
or merge it please?
> =20
> Thanks,
> Yong

Hi Yong

Please copy the list with this sort of thing.  In fact you should just =
always copy the list.  Thanks.

I=E2=80=99m not merging much right now because we are in the middle of =
trying to release 2.6:
https://lists.ozlabs.org/pipermail/openbmc/2019-January/014503.html

If you think it should be in 2.6, we can probably do that.  Do you need =
it in 2.6?

I expect to start merging code again after the three days are over and =
we branch.

thx - brad=3D
