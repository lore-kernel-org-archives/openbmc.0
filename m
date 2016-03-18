Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qR6PL6DgDzDqyR
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 12:01:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3qR6PL4dwyz9sCZ;
 Fri, 18 Mar 2016 12:01:42 +1100 (AEDT)
Subject: Re: [PATCH RFC] Add obmc-console project
To: Patrick Williams <patrick@stwcx.xyz>
References: <1458208528-4143-1-git-send-email-jk@ozlabs.org>
 <20160317163637.GE6045@asimov.austin.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <56EB5373.8070809@ozlabs.org>
Date: Fri, 18 Mar 2016 09:01:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160317163637.GE6045@asimov.austin.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Mar 2016 01:01:42 -0000

Hi Patrick,

> Someone has another pull request that added 'restart' policy to all the
> service files.  I think we want that policy on this service.

Yep, that'd make sense. I'll add that in.

Regards,


Jeremy
