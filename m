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
 by lists.ozlabs.org (Postfix) with ESMTPS id 433bkp3FYFzDqVr
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 05:57:22 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <d372150746d3f52901cbff4a4d422357d6f00676.camel@fuzziesquirrel.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed.tanous@intel.com>, openbmc@lists.ozlabs.org
Date: Mon, 26 Nov 2018 13:57:22 -0500
In-Reply-To: <1bf30dfc-cc55-649d-3b0a-1cf29355daf9@intel.com>
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
 <1bf30dfc-cc55-649d-3b0a-1cf29355daf9@intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 26 Nov 2018 18:57:22 -0000

On Fri, 2018-11-16 at 14:26 -0800, Ed Tanous wrote:
> On 11/16/18 11:58 AM, Oskar Senft wrote:
> > Is there a good place in OpenBMC to post that? Maybe the docs repo?
> > It's 4 PDF files with < 10 MiB in total. Having this information
> > publicly posted by them would make development much easier.
> 
> One thing I wonder is whether or not we (the OpenBMC project) wants
> to
> be in the business of hosting hardware schematics.  It feels a little
> bit out of our wheelhouse.  It seems like a much better thing for an
> organization like OCP to manage, who deals in a lot of open physical
> hardware, and understands the licenses and subtleties around hosting
> that kind of documentation.
> 
> For example, is the company planning on releasing the schematics with
> a
> creative commons, Apache, or MIT license?  I have no idea the
> subtleties
> of that when it comes to hardware schematics, but maybe someone else
> does?  Does posting the schematics with that license open the
> possibility of someone copying the hardware?
> 
> Maybe it makes more sense to post it somewhere outside the OpenBMC
> project (the companies website perhaps) then post a link to it to the
> mailing list?
> 
> I'm mostly just thinking out loud at this point.
> 
> 
> 
> As far as where we put it if we do decide to host it, I don't think a
> git repo is the right choice.  Schematics aren't likely to be source
> controlled (given that they're going to be board files and PDFs, not
> editable schematics) so some kind of file drop seems like a better
> choice than the docs repository.
> 

fwiw I  agree with Ed on all points here...
