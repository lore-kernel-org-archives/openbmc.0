Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JKsp4pffzDqGt
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 04:18:05 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 11:18:01 -0700
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 11:18:00 -0700
Date: Tue, 4 Jun 2019 11:17:59 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Simon =?utf-8?B?Wmh1KOacseiLsea+jSk=?= <zhuysh@inspur.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [Questions]Can bmcweb support both ports 80 and 443
Message-ID: <20190604181759.GB46814@mauery.jf.intel.com>
References: <B851B5C7-9CF8-4F8F-81D8-3A0B3C1A231F@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <B851B5C7-9CF8-4F8F-81D8-3A0B3C1A231F@inspur.com>
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
X-List-Received-Date: Tue, 04 Jun 2019 18:18:07 -0000

On 31-May-2019 01:01 AM, Simon Zhu(=E6=9C=B1=E8=8B=B1=E6=BE=8D) wrote:
>Hello,
>
>	Can bmcweb support both ports 80 and 443?
>	And then we can use http://IP <http://ip/> or https://IP <https://ip/> to=
 visit bmcweb.

In general, there should be no need to use http anymore. https provides=20
security and integrity. It seems like a bad idea to put users'=20
information at risk by not using https.

--Vernon
