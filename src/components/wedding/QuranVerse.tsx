import { motion } from "framer-motion";
import { Wedding } from "@/types/wedding.types";

interface QuranVerseProps {
  wedding: Wedding;
}

const QuranVerse = ({ wedding }: QuranVerseProps) => {
  // Default verse (Ar-Rum: 21)
  const arabicText = wedding.main_verse_arabic || 
    "وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُم مِّنْ أَنفُسِكُمْ أَزْوَاجًا لِّتَسْكُنُوا إِلَيْهَا وَجَعَلَ بَيْنَكُم مَّوَدَّةً وَرَحْمَةً";
  
  const transliteration = wedding.main_verse_transliteration || 
    "Wa min aayaatihee an khalaqa lakum min anfusikum azwaajal litaskunoo ilaihaa wa ja'ala bainakum mawaddataw wa rahmah";
  
  const translation = wedding.main_verse_translation || 
    "And among His signs is that He created for you mates from among yourselves, that you may dwell in tranquility with them, and He has put love and mercy between your hearts.";
  
  const reference = wedding.main_verse_reference || "Ar-Rum: 21";

  return (
    <section className="section-spacing relative overflow-hidden bg-geometric-pattern bg-hexagon-ornament" style={{ '--bg-color': '#1e3a5f' } as React.CSSProperties}>
      {/* Batik pattern border */}
      <div className="absolute top-0 left-0 right-0 batik-border-top" />
      
      <div className="max-w-4xl mx-auto text-center">
        <motion.div
          className="decorative-line mb-8"
          initial={{ scaleX: 0 }}
          whileInView={{ scaleX: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
        />

        <motion.div
          className="glass-container"
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 1 }}
        >
          <p className="font-arabic text-2xl md:text-4xl leading-[2] text-foreground px-4" dir="rtl">
            {arabicText}
          </p>
        </motion.div>

        <motion.div
          className="mt-8 space-y-4"
          initial={{ opacity: 0 }}
          whileInView={{ opacity: 1 }}
          viewport={{ once: true }}
          transition={{ delay: 0.3, duration: 0.8 }}
        >
          <p className="font-body text-sm md:text-base text-muted-foreground italic px-4">
            "{transliteration}"
          </p>
          <p className="font-body text-base md:text-lg text-foreground px-4 leading-relaxed">
            "{translation}"
          </p>
          <p className="font-body text-sm text-accent">
            — {reference}
          </p>
        </motion.div>

        <motion.div
          className="decorative-line mt-8"
          initial={{ scaleX: 0 }}
          whileInView={{ scaleX: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8, delay: 0.5 }}
        />
      </div>
    </section>
  );
};

export default QuranVerse;