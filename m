Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VQXx6ZqkzDqKJ
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 09:22:56 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2019 14:22:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,432,1539673200"; d="scan'208";a="105066051"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga006.jf.intel.com with ESMTP; 02 Jan 2019 14:22:50 -0800
Subject: Re: Testing Phosphor-pid-control
To: Vijay Khemka <vijaykhemka@fb.com>, Patrick Venture <venture@google.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <DFD47DF5-0CAE-4968-AF01-76B5884C2D58@fb.com>
 <7E9441B1E5EFFD4681F54958E821699345985566@ORSMSX114.amr.corp.intel.com>
 <2382D7CD-E130-4EDC-99AE-D993115C2A63@fb.com>
 <CAO=notwPOqcrNMG2H5Yc8kiZa6GGJv+FPbVqeumG9b=Btoc_pw@mail.gmail.com>
 <74BCEC89-4EFC-4FB7-BE76-0367361EDAA2@fb.com>
 <CAO=notwS+gXEVTa-7tqa54qvbmEntSyGJ+c5SeVe1w65yam50Q@mail.gmail.com>
 <FAAA7134-BC1A-4FBC-923B-25109107D389@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <c0297e6f-ba2e-69fe-9690-19dfd56dfeaf@linux.intel.com>
Date: Wed, 2 Jan 2019 14:22:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <FAAA7134-BC1A-4FBC-923B-25109107D389@fb.com>
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
X-List-Received-Date: Wed, 02 Jan 2019 22:22:58 -0000


> How to configure step-wise controller as we need for linear configuration as well.

There's an example here: 
https://github.com/openbmc/entity-manager/blob/master/configurations/Intel%20Front%20Panel.json#L56

Thanks

-James
