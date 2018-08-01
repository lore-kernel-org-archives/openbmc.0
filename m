Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gfRL3k0fzDqDQ;
 Thu,  2 Aug 2018 02:49:33 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2018 09:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,432,1526367600"; d="scan'208";a="59653504"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 01 Aug 2018 09:49:21 -0700
Subject: Re: SSL Certificate management proposal.
To: Hariharasubramanian Ramasubramanian <hramasub@in.ibm.com>
Cc: bradleyb@fuzziesquirrel.com, Jayanth Othayoth <ojayanth@gmail.com>,
 openbmc@lists.ozlabs.org,
 openbmc <openbmc-bounces+hramasub=in.ibm.com@lists.ozlabs.org>
References: <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
 <1d63a4ec-1902-c9d3-13d8-94ef7e437425@intel.com>
 <OF7222EE1F.6CAFD8F2-ON652582DC.00462B53-652582DC.0047E9DE@notes.na.collabserv.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <26322a4a-9668-880c-52e4-b50f8a49e558@intel.com>
Date: Wed, 1 Aug 2018 09:50:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <OF7222EE1F.6CAFD8F2-ON652582DC.00462B53-652582DC.0047E9DE@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 16:49:35 -0000

On 08/01/2018 06:05 AM, Hariharasubramanian Ramasubramanian wrote:
> 
>  > Third, it requires that every BMC be provisioned by the intermediate
>  > authority, which can be difficult if keys either have a cost associated
>  > with them, or are difficult to acquire.
> The cost considerations could potentially be different for Enterprise 
> class servers and servers deployed on the cloud ? I presume enterprises 
> would favour security to cost.
> 

Varies greatly between organizations, and how they manage their threat 
model.  I think that we should support both.
