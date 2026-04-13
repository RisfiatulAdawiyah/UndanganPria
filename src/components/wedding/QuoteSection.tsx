import { motion } from "framer-motion";
import { Wedding } from "@/types/wedding.types";

interface QuoteSectionProps {
  wedding: Wedding;
}

const QuoteSection = ({ wedding }: QuoteSectionProps) => {
  // Default quote (An-Naba: 8)
  const arabicText = wedding.quote_verse_arabic || "وَخَلَقْنَاكُمْ أَزْوَاجًا";
  
  const translation = wedding.quote_verse_translation || "And We created you in pairs.";
  const reference = wedding.quote_verse_reference || "An-Naba: 8";

  return (
    <section className="section-spacing relative overflow-hidden bg-geometric-pattern bg-hexagon-ornament" style={{ '--bg-color': '#193250' } as React.CSSProperties}>
      {/* Batik pattern border */}
      <div className="absolute top-0 left-0 right-0 batik-border-top" />
      
      <div className="max-w-3xl mx-auto text-center">
        <motion.div
          className="glass-container py-12"
          initial={{ opacity: 0, scale: 0.9 }}
          whileInView={{ opacity: 1, scale: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
        >
        <p className="font-arabic text-xl text-accent/80 mb-6" dir="rtl">
          {arabicText}
        </p>
        <p className="font-display text-2xl md:text-3xl text-foreground italic leading-relaxed mb-6">
          "{translation}"
        </p>
        <p className="font-body text-sm text-muted-foreground">
          — {reference}
        </p>
        </motion.div>
      </div>
    </section>
  );
};

export default QuoteSection;