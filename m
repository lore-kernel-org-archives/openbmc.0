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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fHs81WTSzDqW1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 04:49:15 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2019 09:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,481,1539673200"; d="scan'208";a="108471516"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga006.jf.intel.com with ESMTP; 15 Jan 2019 09:49:12 -0800
Date: Tue, 15 Jan 2019 09:49:12 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: archiving ipmitool fork
Message-ID: <20190115174912.GA9159@mauery.jf.intel.com>
References: <3BDB2E0E-E60B-4228-A522-5D5F9CE6D8FD@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3BDB2E0E-E60B-4228-A522-5D5F9CE6D8FD@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 15 Jan 2019 17:49:17 -0000

On 15-Jan-2019 11:02 AM, Brad Bishop wrote:
>Hi Ed
>
>I=E2=80=99m looking at https://gerrit.openbmc-project.xyz/17307
>
>Does this mean we can archive our ipmitool fork on GitHub?

Yes. Once we move to the yocto way of dealing with ipmitool, we can=20
simply manage our stack of patches.

For now, this means that we have a bunch of patches. Once the new ipmi=20
dbus interface is implemented, I plan on pushing the interface upstream=20
to ipmitool. Then we can just use the upstream ipmitool without any=20
patches.

--Vernon
