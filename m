Return-Path: <anuj.mittal@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=anuj.mittal@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ckhP4WYyzDqjP
 for <openbmc@lists.ozlabs.org>; Fri,  4 May 2018 17:50:23 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 May 2018 00:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,361,1520924400"; d="scan'208";a="38365241"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.17.106])
 ([10.221.17.106])
 by orsmga007.jf.intel.com with ESMTP; 04 May 2018 00:50:19 -0700
Subject: Re: [oe] [RESEND][meta-python][PATCH 1/3] meta-python: Add
 python-pyflame recipe
To: Andrew Jeffery <andrew@aj.id.au>, openembedded-devel@lists.openembedded.org
Cc: openbmc@lists.ozlabs.org
References: <20180504070916.11024-1-andrew@aj.id.au>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <ab208a40-d4eb-4807-8f38-824738aff34b@intel.com>
Date: Fri, 4 May 2018 15:50:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180504070916.11024-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 04 May 2018 17:56:24 +1000
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
X-List-Received-Date: Fri, 04 May 2018 07:50:30 -0000

On 05/04/2018 03:09 PM, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta-python/recipes-devtools/python/python-pyflame.inc      | 9 +++++++++
>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb | 5 +++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
> new file mode 100644
> index 000000000000..37ceab888533
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
> @@ -0,0 +1,9 @@
> +S = "${WORKDIR}/pyflame-${PV}"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> +
> +DEPENDS = "python"
> +
> +inherit pkgconfig autotools
> +
> diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> new file mode 100644
> index 000000000000..c902e121231b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> @@ -0,0 +1,5 @@
> +require python-pyflame.inc
> +
> +SRC_URI = "https://github.com/uber/pyflame/archive/v${PV}.tar.gz"

Archive tarball checksums are known to change. Perhaps you can consider
using the release tarball instead?

https://github.com/uber/pyflame/releases
