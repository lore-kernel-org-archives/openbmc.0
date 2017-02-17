Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPlyj62FMzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 19:08:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vPlyj3WsNz9s7r;
 Fri, 17 Feb 2017 19:08:29 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 5/5] drivers/fsi: Add command line FSI test
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
 <20170216220434.79474-6-cbostic@linux.vnet.ibm.com>
Cc: Edward James <eajames@us.ibm.com>, openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <b8aed57b-682e-955d-ca0b-196fa680fcd2@ozlabs.org>
Date: Fri, 17 Feb 2017 16:08:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170216220434.79474-6-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Feb 2017 08:08:29 -0000

Hi Chris,

> Perform FSI reads and writes via the raw sysfs file.  Program
> reads and writes to various locations on the main link and
> off of hub link 1.
> 
> Signed-off-by: Edward James <eajames@us.ibm.com>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsitest.c | 163 ++++++++++++++++++++++++++++++++++++++++++++++++++

Try to avoid putting non-kernel code in the general kernel directories;
we have tools/testing/selftests/ for this kind of thing.

Cheers,


Jeremy
