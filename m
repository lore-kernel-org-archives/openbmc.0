Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445j596DX8zDqXN
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 07:05:47 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2019 12:05:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,401,1544515200"; d="scan'208";a="140864415"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001.jf.intel.com with ESMTP; 22 Feb 2019 12:05:45 -0800
Date: Fri, 22 Feb 2019 12:05:45 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: To restrict IPMI commands
Message-ID: <20190222200545.GA44612@mauery.jf.intel.com>
References: <939F2F2B-6C7E-4EDE-A755-CFFADAD6F1D3@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <939F2F2B-6C7E-4EDE-A755-CFFADAD6F1D3@quantatw.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Fri, 22 Feb 2019 20:05:50 -0000

On 22-Feb-2019 03:03 AM, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) wrote:
>Hi,
>
>Does anyone know how to restrict the IPMI command execution via out-of-ban=
d?
>
>I know that the IPMI commands via in-band can use the whitelist mechanism =
to restrict whether the commands can access the BMC, but I can't use this f=
or the out-of-band.
>
>If there is currently no restriction mechanism for the out-of-band, I will=
 try to add the whitelist function for it just like the in-band.

There is a mechanism in the works for this already. It is a generic=20
filter provider that allows filtering of commands based on any criteria.=20
See=20
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/13896=20
for the current implementation.

--Vernon
