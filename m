Return-Path: <cyril.bur@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x15r85PyszDr2h
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 09:21:44 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v62NIgwC135363
 for <openbmc@lists.ozlabs.org>; Sun, 2 Jul 2017 19:21:40 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bf15vpt12-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jul 2017 19:21:39 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Mon, 3 Jul 2017 09:21:36 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 3 Jul 2017 09:21:35 +1000
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v62NLYMZ5964132
 for <openbmc@lists.ozlabs.org>; Mon, 3 Jul 2017 09:21:34 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v62NLWEv016637
 for <openbmc@lists.ozlabs.org>; Mon, 3 Jul 2017 09:21:32 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v62NLWtV016634; Mon, 3 Jul 2017 09:21:32 +1000
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D9F76A0173;
 Mon,  3 Jul 2017 09:21:33 +1000 (AEST)
Subject: Re: [PATCH skiboot/pflash] libflash/libffs: Detect first byte flash
 corruption
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Date: Mon, 03 Jul 2017 09:21:33 +1000
In-Reply-To: <20170630133451.6C6336E044@b03ledav001.gho.boulder.ibm.com>
References: <20170628224041.14315-1-cyril.bur@au1.ibm.com>
 <20170630133451.6C6336E044@b03ledav001.gho.boulder.ibm.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.3 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
x-cbid: 17070223-1617-0000-0000-000001F071F3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070223-1618-0000-0000-00004837B393
Message-Id: <1499037693.1700.3.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-02_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707020404
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
X-List-Received-Date: Sun, 02 Jul 2017 23:21:45 -0000

On Fri, 2017-06-30 at 15:34 +0200, Cédric Le Goater wrote:
> On 06/29/2017 12:40 AM, Cyril Bur wrote:
> > This patch is not for upstream but currently this unknown corruption is
> > making life difficult.
> 
> From what I have seen on a couple of affected systems, the data is 
> not corrupted but it's the first byte read which is bogus. After a
> reboot, all comes back to normal. 

Interesting. Especially since there is no corruption, depending on how
long this hangs around for this patch might be useful.

> 
> So we might have an issue with the optimize read settings and/or 
> fast-read. This is difficult to corner. 
> 
> Has anyone seen this issue on the openbmc 4.7 kernel ? 
>  

Have you ever seen it on a ast2400 or is it always ast2500?

> Thanks,
> 
> C.
> 
> 
> > Perhaps it can be useful at least temporarily.
> > 
> > Feel free to remove the option to continue and leave just the
> > information message.
> > 
> > Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
> > ---
> >  libflash/libffs.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/libflash/libffs.c b/libflash/libffs.c
> > index 7ae9050e..dce6237e 100644
> > --- a/libflash/libffs.c
> > +++ b/libflash/libffs.c
> > @@ -260,6 +260,35 @@ int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
> >  
> >  	/* Convert and check flash header */
> >  	rc = ffs_check_convert_header(&f->hdr, &raw_hdr);
> > +	/*
> > +	 * A bug on witherspoon of currently unknown origin causes
> > +	 * corruption of the first byte of flash. This is by no means
> > +	 * a fix and should never go upstream but may prove helpful.
> > +	 */
> > +	if (rc == FFS_ERR_BAD_MAGIC) {
> > +		/*
> > +		 * We can set the first byte to what we know it should be
> > +		 * and try to check and convert header again. If it
> > +		 * succeeds there is a very high chance this is the
> > +		 * problem.
> > +		 */
> > +		*(char *)&raw_hdr = 'P';
> > +		rc = ffs_check_convert_header(&f->hdr, &raw_hdr);
> > +		if (rc) {
> > +			/*
> > +			 * Turn it back into BAD_MAGIC, the flash obviously
> > +			 * has bigger problems.
> > +			 */
> > +			rc = FFS_ERR_BAD_MAGIC;
> > +		} else {
> > +			FL_ERR("FFS: Detected corruption of the first byte of flash.\n");
> > +			FL_ERR("     Recommend hard power cycling the entire machine\n");
> > +			FL_ERR("     Continuing is dangerous!\n");
> > +			FL_ERR("     Continuing in 10 seconds\n");
> > +			sleep(10);
> > +			rc = 0;
> > +		}
> > +	}
> >  	if (rc) {
> >  		FL_INF("FFS: Flash header not found. Code: %d\n", rc);
> >  		goto out;
> > 
> 
> 
