Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D18BD1A0050
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 11:10:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=dgGvFC/o; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id 65so4157636pfd.1
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 16:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=UUeo9dLXe+DaEEDpxOBBdbXO9RsrbG5KvAU8Lr07WxQ=;
 b=dgGvFC/oAp+JJ5f8sKNxkcBCuiH90StJcgwpZLswlT4BnJReH53WVP6LPaGF9a4Jfv
 eMq6iEqPSvytOCMbkedIX4rGaWLsR+Mq8WdcAY8zzUfAYooiJ6XiiP/qqHROIK7WcYA1
 j0UEEdLCYmwCAbIsZAi9lGqDijiFIp3AOMUPqm9Igo7NSXnIDO/yfzBgHRf451JxRrI9
 zfNr+HQhLxmuOR1p5cb0aMDoALusZGObQsS4dLZzWq51IrIrIKPxUqlhoK2LVRvfRWqF
 1pakDDuGv43aeqwpbs1GNowBYi1R0IIzY7YX3z02R3s92Bp8Nt+6141ee8UMacSmHo3j
 YVbA==
X-Received: by 10.98.9.147 with SMTP id 19mr24900952pfj.163.1452557446117;
 Mon, 11 Jan 2016 16:10:46 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id f27sm25705979pfj.0.2016.01.11.16.10.44
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 11 Jan 2016 16:10:45 -0800 (PST)
Date: Tue, 12 Jan 2016 11:10:38 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc-test-automation 00/60] Pull Manjunath's
 automation repository
Message-ID: <20160112111038.0915e033@camb691>
In-Reply-To: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Tue, 12 Jan 2016 00:10:48 -0000

On Mon, 11 Jan 2016 10:49:26 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> Pull Manjunath's repository: https://github.com/mkumatag/openbmc-automation
> into openbmc.
> 

Ummmm what happened here? It looks like the entire series is sent twice?

I've had an initial skim read and it looks to me like you can squash A LOT of
those patches together.

The commits don't need to be a story of how you got from no code to the
this point in time. Each commit should add a feature and associated
documentation. It looks like most of patches 0-6 can be one commit, same for
some subsequent patches.

Heres an example of some issues I've noticed:

In patch 2 you add tests/test_ssh.robot but then in patch 7 you delete 
tests/test_ssh.robot. There are several examples of a patch adding a
significant chunk of work and then a later patch removing this chunk of work, if
after the series the chunk of work won't be in the repo then it shouldn't have
appeared in the series at all.

Patch 26 "Fix errors" should be squashed into the broken commit. Patch 22 looks
that way too and Patch 17. The reason we do this is that way when something
does go wrong and something doesn't work it makes it much easier to find the
broken patch, you should never submit a patches that is broken even if it is
fixed directly after this breaks the assumption that every commit we make is
good and therefore when chasing a bug if a broken patch is found, is it likely
to be that bug, much easier to automate.

Your patch 28 that "Adds one more ssl test" should be squashed into the patch
adding the ssl tests, add them all once for this series. You can always more
work on more later but this series you have one patch adding ssl tests, have
all the ssl tests you're adding in that patch.

Hopefully that makes sense, please ask if I've just rambled!

Cyril

> https://github.com/openbmc/openbmc-test-automation/pull/1
> 
> Chris Austen (16):
>   Added DIMM specific inventory tests
>   base add for sensor tests
>   fixed review comments
>   created loops for tests
>   Add initial rest test cases     Support to test Null properties
>   Added full sensor suite
>   Update README.md
>   Handle new rest client from Brad
>   Added DIMM specific inventory tests
>   base add for sensor tests
>   fixed review comments
>   created loops for tests
>   Add initial rest test cases     Support to test Null properties
>   Added full sensor suite
>   Update README.md
>   Handle new rest client from Brad
> 
> Manjunath A Kumatagi (34):
>   Added git ignore file
>   Use argumnet file with pyrobot and added instructions to READEME file.
>   Update README for better html display
>   Added Inventory list testcase
>   fixed errors in tox and generate_argumentfile.sh script
>   Moved Read Attribute and Read Properties to rest_client
>   fix review comment
>   Added SSL tests
>   Ran the tests and fixed errors in SSL tests
>   Modified the doc
>   Added firmware version validation test
>   update readme file with tox version
>   Fix errors
>   Fix Errors in test_obmcrest.robot and removed the empty testcases.
>   Added one more testcase to test non-ssl connection to port 443
>   OpenBMC REST Testing
>   updated the REST API for firmware version
>   Added git ignore file
>   Use argumnet file with pyrobot and added instructions to READEME file.
>   Update README for better html display
>   Added Inventory list testcase
>   fixed errors in tox and generate_argumentfile.sh script
>   Moved Read Attribute and Read Properties to rest_client
>   fix review comment
>   Added SSL tests
>   Ran the tests and fixed errors in SSL tests
>   Modified the doc
>   Added firmware version validation test
>   update readme file with tox version
>   Fix errors
>   Fix Errors in test_obmcrest.robot and removed the empty testcases.
>   Added one more testcase to test non-ssl connection to port 443
>   OpenBMC REST Testing
>   updated the REST API for firmware version
> 
> Manjunath Kumatagi (2):
>   first commit
>   first commit
> 
> manjunath (6):
>   added files
>   added log statement
>   added testcase for etc passwd
>   added files
>   added log statement
>   added testcase for etc passwd
> 
> mkumatag (2):
>   Update README.md
>   Update README.md
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
