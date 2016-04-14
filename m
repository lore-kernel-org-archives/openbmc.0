Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qlnhh0C6xzDq5y
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 14:27:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3qlnhg5wg2z9sBg
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 14:27:47 +1000 (AEST)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
Subject: bitesize tag for OpenBMC issues
Message-ID: <570F1C43.2070809@ozlabs.org>
Date: Thu, 14 Apr 2016 12:27:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Thu, 14 Apr 2016 04:27:48 -0000

Hi all,

In our continuous effort to lower the barrier-to-entry for OpenBMC
contribution, I've added a 'bitesize' tag to a couple of our
repositories on github.

This tag is intended for issues that could feasibly done by a relative
newcomer to OpenBMC. A few general criteria that I'd suggest we use:

 - Are self-contains and don't require an understanding of multiple
   subsystems

 - Doesn't require in-depth knowledge of OpenBMC internals

 - Doesn't involve long-term design decisions, or external interface
   definitions

 - Are fairly-completely described by the content of the issue

I don't think all bitesize bugs should necessarily be "easy", but just
well-encapsulated and can provide a starting point for someone with
technical experience in related fields.

For example, we'll be using this for kernel issues that a kernel
developer, with no prior OpenBMC experience, could potentially help out
with.

These issues will then appear in our project-wide query:

  https://github.com/issues?utf8=%E2%9C%93&q=is%3Aopen+is%3Aissue+user%3Aopenbmc+label%3Abitesize

- which is referenced in our contributing doc:

  https://github.com/openbmc/docs/blob/master/contributing.md

So: please feel free to add this label to your bugs & enhancements! If
you'd like to use this on a repo that doesn't already have the label
available, please let Patrick or me know, and we can add it.

Cheers,


Jeremy
