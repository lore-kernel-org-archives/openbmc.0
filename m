Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJXLC61kkzDrLX
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 12:07:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="gc4raqjX"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xJXLC2w67z9s3T;
 Fri, 28 Jul 2017 12:07:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1501207667; bh=GNEzUXtOX9mZ2lLp26VwUz0QguMDsD9XVE4LeNHOghQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gc4raqjX6B3XFbdTUI/rur5ohNnoo0WhINM3x+ohGzbgmxILEjdt/baYhKb1isyZt
 KdpNypSrzYj20AgFx6DSLaFSBY5sRjj9paRQ4XnmtNksA0X4jWRx+HuVJ+Po/ZbI57
 Y1yiqW+d7MBB2+3UKiV8epkpIDOZVDYtqWEBfRzKh9N9DpJ2s4bw0afqM/sgc0ZmoE
 zQ5OYu+MVn5XYfjAWIc0P9K0n1D89pvVGGYpjGFBVacaPZee9x52H7kWcgcJ214fYw
 cwlYYXSCNzOextfijltvbEJKR1bEHXhuGLWu5DEPm+d1AafF5jmtU4pIb/iVjlXexF
 8j8RE9I4t/zqw==
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Remove scan from master
 registration
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
References: <1501180508-4009-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <0a2cb633-ae2a-7dd2-fe7d-cf565be4d8c2@ozlabs.org>
Date: Fri, 28 Jul 2017 10:07:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501180508-4009-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
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
X-List-Received-Date: Fri, 28 Jul 2017 02:07:49 -0000

Hi Chris,

> Scanning during master registration is problematic because the gpio fsi
> master will be registered during boot if it is present in device-tree
> (it's a platform device). That means that the whole fsi scan occurs
> during boot, which can cause problems.

What kind of problems?

This sounds a bit awkward to me - it's fairly reasonable to expect the
master to probe immediately. Requiring manual scan adds some unusual
dependencies to the bus initialisation process.

Cheers,


Jeremy
