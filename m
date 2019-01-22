Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kkxK07yGzDqL5
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 10:23:15 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2019 15:23:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,508,1539673200"; d="scan'208";a="313940371"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jan 2019 15:23:13 -0800
Subject: Re: Intel-ipmi-oem repo
To: Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
 <1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com>
 <0B0A393C-5A14-42A0-86A1-9606CD7F942C@fb.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <c51204c7-45d9-6af6-9a25-0e226b7300c3@intel.com>
Date: Tue, 22 Jan 2019 15:25:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <0B0A393C-5A14-42A0-86A1-9606CD7F942C@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 22 Jan 2019 23:23:18 -0000

On 1/22/19 2:22 PM, Vijay Khemka wrote:
> If we can manage this in standard repo with some compile time config
> parameter to use chosen approach. It will help in maintaining multiple repo.
> 
>  

I believe this was proposed at one point on one of the calls, but I
don't remember what the conclusion was.  Based on my understanding it
was possible technically, but then we went down the rabbit hole of
trying to make a single solution that met everyone's needs.  We could
certainly start moving in the direction of an #ifdef to support both
ways, with the eventual hope that we could converge on a single solution.
