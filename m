Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420lhF1r5kzF31Q
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 22:45:00 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 096B9EA09B;
 Wed, 29 Aug 2018 08:44:58 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Two Google-Origin Daemons
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notx7e+sfKm3t07-kg3pjrk2H3E5p=jQsZsW=Ekosd7=yyw@mail.gmail.com>
Date: Wed, 29 Aug 2018 08:44:57 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Message-Id: <56709AAD-BB1E-4611-83E9-4440FAF81541@fuzziesquirrel.com>
References: <CAO=notx7e+sfKm3t07-kg3pjrk2H3E5p=jQsZsW=Ekosd7=yyw@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 12:45:01 -0000



> On Aug 28, 2018, at 4:50 PM, Patrick Venture <venture@google.com> wrote:
> 
> Brad;
> 
> We have two daemons (to start with) that we'd like to send up.  So my
> question is, should we put these to live under
> openbmc/google-{reponame} or google/{reponame} and point the recipe in
> meta-google to google/ or openbmc/ ?
> 
> I'm inclined to say the code can live under openbmc/ so that others
> can see it, and because it uses openbmc stuff.

This is fine by me.  It would be nice to know what they do.  I may have
an opinion on what they are called (the repositories).

This highlights a concern I have.  The project could use some formal
criteria for hosting code on openbmc.  Then we could evaluate new
repository requests based on those criteria.  Open to thoughts on that...

> 
> Patrick
