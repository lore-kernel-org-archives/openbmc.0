Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqNrH6nRkzDrPb
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 18:02:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sqNrH4LxKz9s3s;
 Thu,  6 Oct 2016 18:02:23 +1100 (AEDT)
Subject: Re: [PATCH linux 15/15] drivers/fsi: Initialize CFAMs for read/write
 access
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475700868-75737-16-git-send-email-christopher.lee.bostic@gmail.com>
 <428264fa-63bf-23a3-0a54-7acf0f3585ad@ozlabs.org>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <26b2edff-d7b0-0c71-434b-bfa8c5e13649@ozlabs.org>
Date: Thu, 6 Oct 2016 15:02:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <428264fa-63bf-23a3-0a54-7acf0f3585ad@ozlabs.org>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Thu, 06 Oct 2016 07:02:24 -0000

Hi Chris,

> static int fsi_master_break(struct fsi_master *master, int link)
> {
> 	int rc = 0;
> 
> 	if (master->break)
> 		master->break(master, link)

Sorry, that should be:
 		rc = master->break(master, link);

Cheers,


Jeremy
