Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 441S7z5SktzDqd2
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 09:08:30 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Feb 2019 14:08:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,374,1544515200"; d="scan'208";a="122800841"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga007.fm.intel.com with ESMTP; 15 Feb 2019 14:08:26 -0800
Subject: Re: Building intel s2600wf image
To: Wim Vervoorn <wvervoorn@eltan.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <0dd29982f6954541a2ce2420c87684e7@Eltsrv03.Eltan.local>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <8bd2d371-29ab-d2f1-ca0b-6f572b021ac5@linux.intel.com>
Date: Fri, 15 Feb 2019 14:08:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <0dd29982f6954541a2ce2420c87684e7@Eltsrv03.Eltan.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 15 Feb 2019 22:08:32 -0000

On 2/15/19 8:31 AM, Wim Vervoorn wrote:
> I noticed that the facebook-tiogapass.dts has the items for kcs2 and 3 included while the s2600wf.dts doesn't assign addresses for these devices (leaving the kcs_addr at 0 causing the driver not to load).
> 
> I this intentional and do start the driver in another way or should I change the dts?

The dts needs to have the kcs nodes added. This hasn't been upstreamed 
yet. Should look like:

  +&kcs3 {
  +   kcs_addr = <0xCA2>;
  +   status = "okay";
  +};
  +
  +&kcs4 {
  +   kcs_addr = <0xCA4>;
  +   status = "okay";
  +};



Thanks,

James
