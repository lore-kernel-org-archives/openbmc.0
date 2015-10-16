Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7FEC01A074E
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 15:13:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=E/JwvMME; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=IpNYHgbT; 
 dkim-atps=neutral
Received: by oiar126 with SMTP id r126so57814153oia.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2015 21:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=XRr430uN90YLjYVv54Oy/T8tn1M7+3j13N51vQ7Iiqc=;
 b=E/JwvMMEZ3oQU0l2Gw7MZzziKEVPnFTEkvItKB8fhcE1Ye/HSTTqJP4er53W1Kkrhe
 9LxmbMVKoDwhfaO12ffb00jQwZ2NSgxqlhQp72C85KyfbA/0xLjBdTaIlKX2iIN2LtYO
 zF2b1aJDdNNAk8ADt8WE6k9agskhocqW46UT4F8+LdhFFaDqhpGF7+neM/pyp/Np5X0m
 Y4+rZQ1n2YkzDVi6x8BquGNaZhS0GG4R1q+A9WYJ3rnPaqShiVnHeJsQXQGcqhyikI8P
 TCV6AiSW8C+OzT62IhVYDgOYuPuKhrmmv5z8UBassZK1LHpXmlrZlLT/ChwjcRj+OcjU
 39mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=XRr430uN90YLjYVv54Oy/T8tn1M7+3j13N51vQ7Iiqc=;
 b=IpNYHgbTyYLxn4EXvw6rEvJRJeb2EUbV6utnNdv6HAiJXtzP+NhfHrGIWbAh7ULr1R
 rWuNkOh/HXPZqix1lKS+P3g+gYgTp/d9W8hb0GKIZSo9U9UZi+1zq0sQ0fzy+BO4aVgF
 tns+1WpvilZeF3TZDjVC7m9REARktrM0Tos2E=
X-Received: by 10.202.77.150 with SMTP id a144mr7748902oib.20.1444968789424;
 Thu, 15 Oct 2015 21:13:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Thu, 15 Oct 2015 21:12:49 -0700 (PDT)
In-Reply-To: <1444923803-24688-4-git-send-email-patches@stwcx.xyz>
References: <1444923803-24688-1-git-send-email-patches@stwcx.xyz>
 <1444923803-24688-4-git-send-email-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Oct 2015 14:42:49 +1030
X-Google-Sender-Auth: LnIFS-uNR_m_uKKlInqI-eBvz4s
Message-ID: <CACPK8XfvXL2Cq=tavbmaMsczus_fbV38V6NxSEujpqkMA8mLaw@mail.gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid 3/4] Suport examining sensor records
 and calling dbus
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 16 Oct 2015 04:13:12 -0000

On Fri, Oct 16, 2015 at 2:13 AM, OpenBMC Patches <patches@stwcx.xyz> wrote:
> From: Chris Austen <austenc@us.ibm.com>
>
> ---
>  Makefile        |   5 ++-
>  ipmisensor.C    | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  sensorhandler.C |   8 +++-
>  3 files changed, 128 insertions(+), 4 deletions(-)
>  create mode 100644 ipmisensor.C
>
> diff --git a/Makefile b/Makefile
> index 2177c9d..e27fe2d 100755
> --- a/Makefile
> +++ b/Makefile
> @@ -5,7 +5,8 @@ DAEMON_OBJ  = $(DAEMON).o
>  LIB_APP_OBJ = apphandler.o     \
>                sensorhandler.o  \
>                storagehandler.o \
> -              dcmihandler.o
> +              dcmihandler.o    \
> +              ipmisensor.o
>
>  LIB_APP     = libapphandler.so
>
> @@ -25,4 +26,4 @@ $(DAEMON): $(DAEMON_OBJ)
>         $(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
>
>  clean:
> -       rm -f $(DAEMON) *.o *.so
> +       rm -f $(DAEMON) *.o *.so

$(RM) $(DAEMON) $(DAEMON_OBJ) $(LIB_APP_OBJ)

> \ No newline at end of file
> diff --git a/ipmisensor.C b/ipmisensor.C
> new file mode 100644
> index 0000000..c2370b8
> --- /dev/null
> +++ b/ipmisensor.C
> @@ -0,0 +1,119 @@
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdint.h>
> +
> +

Whitespace.

> +extern unsigned char findSensor(char);
> +
> +struct sensorRES_t {

what does RES stand for? struct sensor_result is less cryptic.

> +       uint8_t sensor_number;
> +       uint8_t operation;
> +       uint8_t sensor_reading;
> +       uint8_t assert_state7_0;
> +       uint8_t assert_state14_8;
> +       uint8_t deassert_state7_0;
> +       uint8_t deassert_state14_8;
> +       uint8_t event_data1;
> +       uint8_t event_data2;
> +       uint8_t event_data3;

Any reason to not have uint8_t event_data[3] ?

> +} __attribute__ ((packed));

You don't need the attribute.

> +
> +#define ISBITSET(x,y) ((x>>y)&0x01)
> +#define ASSERTINDEX 0
> +#define DEASSERTINDEX 1
> +
> +

Whitespace.

> +extern int updateDbusInterface(uint8_t , const char *, const char *) ;

Whitespace at the end of the line.

Regarding naming, is there a good reason to be mixing CamelCase with
underscores? Your code should pick one and stick with it.

> +extern int set_sensor_dbus_state(uint8_t ,const char *, const char *);
> +
> +
> +

Whitespace.

> +// Sensor Type,  Offset, function handler, Dbus Method, Assert value, Deassert value
> +struct lookup_t {
> +       uint8_t sensor_type;
> +       uint8_t offset;
> +       int (*func)(uint8_t, const char *, const char *);
> +       char    method[16];
> +       char    assertion[16];
> +       char    deassertion[16];

What are the strings for?

> +};
> +
> +
> +//  This table lists only senors we care about telling dbus about.

Spelling.

Use /* for block comments.

> +//  Offset definition cab be found in section 42.2 of the IPMI 2.0
> +//  spec.  Add more if/when there are more items of interest.
> +lookup_t ipmidbuslookup[] = {

static const ?

> +
> +       {0x07, 0x07, set_sensor_dbus_state, "setPresent", "True", "False"},
> +       {0x07, 0x08, set_sensor_dbus_state, "setFault",   "True", "False"},
> +       {0x0C, 0x06, set_sensor_dbus_state, "setPresent", "True", "False"},
> +       {0x0C, 0x04, set_sensor_dbus_state, "setFault",   "True", "False"},
> +       {0xFF, 0xFF, NULL,                  "",            "" ,    ""}
> +};
> +
> +int findindex(const uint8_t sensor_type, int offset, int *index) {
> +
> +       int i=0, rc=0;
> +       lookup_t *pTable = ipmidbuslookup;

Why do you create the local pointer?

> +
> +       do {
> +
> +               if ( ((pTable+i)->sensor_type == sensor_type) &&
> +                        ((pTable+i)->offset  == offset)  ) {
> +                       rc = 1;
> +                       *index = i;
> +                       break;
> +               }
> +               i++;
> +       } while ((pTable+i)->sensor_type  != 0xFF);
> +
> +       return rc;
> +}
> +
> +int shouldReport(sensorRES_t *pRec, uint8_t sensorType, int offset, int assertState) {
> +
> +       int index;
> +       char *pState;

state.

> +       lookup_t *pTable = ipmidbuslookup;

table.

> +
> +       if (findindex(sensorType, offset, &index)) {
> +
> +               if (assertState == ASSERTINDEX) {
> +                       pState = (pTable+index)->assertion;
> +               } else {
> +                       pState = (pTable+index)->deassertion;
> +               }
> +               (*((pTable+index)->func))(pRec->sensor_number, (pTable+index)->method, pState);
> +       }
> +
> +       return 0;
> +}
> +
> +

Whitespace.

> +int updateSensorRecordFromSSRAESC(const void *record) {

What does SSRAESC? I think this name could be more concise.

Is there a good reason for the void *?

> +
> +       sensorRES_t *pRec = (sensorRES_t *) record;
> +       unsigned char stype;
> +       int index, i=0;
> +
> +       stype = findSensor(pRec->sensor_number);
> +
> +       // Scroll through each bit position .  Determine
> +       // if any bit is either asserted or Deasserted.
> +       for(i=0;i<8;i++) {
> +               if (ISBITSET(pRec->assert_state7_0,i)) {
> +                       shouldReport(pRec, stype, i, ASSERTINDEX);
> +               }
> +               if (ISBITSET(pRec->assert_state14_8,i)) {
> +                       shouldReport(pRec, stype, i+8, ASSERTINDEX);
> +               }
> +               if (ISBITSET(pRec->deassert_state7_0,i)) {
> +                       shouldReport(pRec, stype, i, DEASSERTINDEX);
> +               }
> +               if (ISBITSET(pRec->deassert_state14_8,i)) {
> +                       shouldReport(pRec, stype, i+8, DEASSERTINDEX);
> +               }
> +       }
> +
> +       return 0;
> +}
> diff --git a/sensorhandler.C b/sensorhandler.C
> index 9f0c975..0b16d10 100644
> --- a/sensorhandler.C
> +++ b/sensorhandler.C
> @@ -4,6 +4,7 @@
>  #include <string.h>
>  #include <stdint.h>
>
> +extern int updateSensorRecordFromSSRAESC(const void *);
>
>  void register_netfn_sen_functions()   __attribute__((constructor));
>
> @@ -166,20 +167,22 @@ ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>      ipmi_ret_t rc = IPMI_CC_OK;
>      unsigned short rlen;
>
> -    rlen = (unsigned short) *data_len - 1;
> +    rlen = (unsigned short) *data_len;
>
>      sprintf(string, "%s%02x", "/tmp/sen", reqptr->sennum);

snprintf.

Can you explain why this needs to write out to a file?

>
>      printf("IPMI SET_SENSOR [%s]\n",string);
>
>      if ((fp = fopen(string, "wb")) != NULL) {
> -        fwrite(reqptr+1,rlen,1,fp);
> +        fwrite(reqptr,rlen,1,fp);
>          fclose(fp);
>      } else {
>          fprintf(stderr, "Error trying to write to sensor file %s\n",string);
>          ipmi_ret_t rc = IPMI_CC_INVALID;
>      }
>
> +    updateSensorRecordFromSSRAESC(reqptr);
> +
>      *data_len=0;
>
>
> @@ -209,5 +212,6 @@ void register_netfn_sen_functions()
>
>      printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_SET_SENSOR);
>      ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_SET_SENSOR, NULL, ipmi_sen_set_sensor);
> +
>      return;
>  }
> --
> 2.6.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
