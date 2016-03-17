Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQvBC29x3zDq6W
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 03:36:19 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1458232384568934.3813975638462;
 Thu, 17 Mar 2016 09:33:04 -0700 (PDT)
Date: Thu, 17 Mar 2016 11:33:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Chris Austen <austenc@us.ibm.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] runqemu: Add palmetto target
Message-ID: <20160317163301.GC6045@asimov.austin.ibm.com>
References: <CACPK8XfWpkJ8HEbK4wOzWGrcfccBdRKoumsoQboj772jrgzUKA@mail.gmail.com>
 <1458190368-24002-1-git-send-email-andrew@aj.id.au>
 <1458190368-24002-2-git-send-email-andrew@aj.id.au>
 <201603170742.u2H7gV1L022606@d03av01.boulder.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201603170742.u2H7gV1L022606@d03av01.boulder.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 17 Mar 2016 16:36:19 -0000

On Thu, Mar 17, 2016 at 07:42:11AM +0000, Chris Austen wrote:
>     
>    Add your command to the same help file here you see the existing qemuarm
>    target
>     
>    You can now run 'bitbake <target>'
>    Common targets are:
>         obmc-phosphor-image
>    You can also run generated qemu images with a command like:
>         runqemu qemuarm <<<<<---------WHERE EVER THAT COMES FROM
>     

Along the lines of some of my previous comments...

Maybe we don't need/want to add 'palmetto' as a machine type.  Is there
a mechanism for us to override some of the 'qemuarm' behavior to match
'palmetto' when that is the machine we built for.  Then your yocto
machine profile will control which qemuarm machine it is running on.

Again, probably should discuss with #yocto to get ideas on how to
proceed.  I anticipate we may someday have lots and lots of machines so
maintaining the runqemu script ourselves sounds unpleasant.


> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


-- 
Patrick Williams
