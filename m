Return-Path: <sam.mj@au1.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D48131A0050
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 13:05:47 +1100 (AEDT)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <sam.mj@au1.ibm.com>;
 Fri, 15 Jan 2016 12:05:45 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 15 Jan 2016 12:05:43 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: sam.mj@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 07B213578055
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 13:05:42 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0F25Zxj18940148
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 13:05:43 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0F2592D024378
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 13:05:09 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0F259Bv023534; Fri, 15 Jan 2016 13:05:09 +1100
Received: from localhost (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E10DCA0118;
 Fri, 15 Jan 2016 13:04:44 +1100 (AEDT)
Date: Fri, 15 Jan 2016 13:04:44 +1100
From: Sam Mendoza-Jonas <sam@mendozajonas.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH docs] Add doc for contribution guidelines
Message-ID: <20160115020444.GA2639@localhost.localdomain>
References: <1452762609-724-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452762609-724-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1452762609-724-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011502-0009-0000-0000-000002C58C27
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
X-List-Received-Date: Fri, 15 Jan 2016 02:05:48 -0000

On Thu, Jan 14, 2016 at 03:10:09AM -0600, OpenBMC Patches wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
<snip>
> +OpenBMC has quite a module structure, consisting of small daemons with a
> +limited set of responsibilities. These communicate over dbus with other
> +components, to implement the complete BMC system.
<snip>

Just a nitpick: should that be s/module/modular?
